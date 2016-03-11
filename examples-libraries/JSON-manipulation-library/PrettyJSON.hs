----------------------------------------------------------------------------------------------------------
-- This file contains funtions that act as a RENDERER for JValues, e.g. it
-- gets a JValue as input and it PRINT it out in a human friendly way
--
-- This file is the "complex version" of a renderer. See PutJSON.hs for a more simple version.
----------------------------------------------------------------------------------------------------------
--
import Numeric (showHex)
import Data.Char (ord)
import Data.Bits (shiftR, (.&.))

import SimpleJSON (JValue(..))

import Prettify (Doc, (<>), char, double, fsep, hcat, punctuate, text,
                 compact, pretty)

renderJValue :: JValue -> Doc
renderJValue (JBool True)  = text "true" -- NOTE: text is implemented in Prettify.hs
renderJValue (JBool False) = text "false"
renderJValue JNull         = text "null"
renderJValue (JNumber num) = double num -- NOTE: double is implemented in Prettify.hs
renderJValue (JString str) = string str -- NOTE: string is implemented in this file
renderJValue (JArray ary) = series '[' ']' renderJValue ary
renderJValue (JObject obj) = series '{' '}' field obj
    where field (name,val) = string name
                          <> text ": "
                          <> renderJValue val


----------------------------------------------------------------------------------------------------------
-- Helper to render a JString of the datatype JValue using renderJValue:
----------------------------------------------------------------------------------------------------------

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar
-- NOTE: hcat defined in Prettify.hs

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right
-- NOTE: char,<> defined in Prettify.hs

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
              Just r -> text r
              Nothing | mustEscape c -> hexEscape c
                      | otherwise    -> char c
    where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

hexEscape :: Char -> Doc
hexEscape c | d < 0x10000 = smallHex d
            | otherwise   = astral (d - 0x10000)
  where d = ord c

astral :: Int -> Doc
astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)
    where a = (n `shiftR` 10) .&. 0x3ff
          b = n .&. 0x3ff

smallHex :: Int -> Doc
smallHex x  = text "\\u"
           <> text (replicate (4 - length h) '0')
           <> text h
    where h = showHex x ""
          
simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\',b])

----------------------------------------------------------------------------------------------------------
-- Helper to render a JArray and JObject of the datatype JValue using renderJValue:
----------------------------------------------------------------------------------------------------------

series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
series open close item = enclose open close
                        . fsep . punctuate (char ',') . map item
 

----------------------------------------------------------------------------------------------------------
-- GOOD HASKELL STYLE: SEPARATE PURE CODE FROM IO
-- Function printing out the string
----------------------------------------------------------------------------------------------------------

compactJValue :: JValue -> IO ()
compactJValue v = putStrLn (compact (renderJValue v))

prettyJValue :: Int -> JValue -> IO ()
prettyJValue ncol v = putStrLn (pretty ncol (renderJValue v))

-- HOWTO RUN:
-- *Main> compactJValue (JObject [("f", JNumber 1), ("q", JBool True)])
-- {"f": 1.0,
-- "q": true
-- }
-- *Main> prettyJValue 10 (JObject [("f", JNumber 1), ("q", JBool True)])
-- {"f": 1.0,
-- "q": true
-- }
-- *Main> prettyJValue 30 (JObject [("f", JNumber 1), ("q", JBool True)])
-- {"f": 1.0, "q": true }

