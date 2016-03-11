----------------------------------------------------------------------------------------------------------
-- This file contains a funtion that act as a RENDERER for JValues, e.g. it
-- gets a JValue as input and it PRINT it out in a human friendly way
--
-- This file is the "simple version" of a renderer. See PrettyJSON.hs for a more complex version.
----------------------------------------------------------------------------------------------------------
--
module PutJSON where

-- import useful function from List
import Data.List (intercalate)
-- import JValue datatype definition
import SimpleJSON

renderJValue :: JValue -> String
renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue JNull = "null"
renderJValue (JObject o) = "{" ++ pairs o ++ "}" -- o is a pair (String,JValue)
  where pairs [] = ""
        pairs ps = intercalate ", " (map renderPair ps) -- o is a pair (String,JValue)
        renderPair (k,v) = show k ++ ": " ++ renderJValue v -- (k,v) is a pair (String,JValue)
renderJValue (JArray a) = "[" ++ values a ++ "]"
  where values [] = ""
        values vs = intercalate ", " (map renderJValue vs) -- vs is a list of JValue = [JValue]
  
-- GOOD HASKELL STYLE: SEPARATE PURE CODE FROM IO
-- Function printing out the string
putJValue :: JValue -> IO ()
putJValue v = putStrLn (renderJValue v)

-- HOWTO RUN:
-- *PutJSON> putJValue (JObject [("Hi",(JBool True))])
-- {"Hi": true}
