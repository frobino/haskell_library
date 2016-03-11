-- This file will become PrettyJSON.hs, which is the library including functions to render (print out in a
-- nice way) our custom type JValue.
--
-- This file is left as it is to show how to create a SKELETON for a file that compiles.
--
-- This is achieved through the use of "undefined".
-- Creating a stub is considered a good manner when writing Haskell code.
-- Being Haskell very strict with compilation, is good to compile often to check where a possible fail can be.
--
-- Then, after we have a compilable skeleton (stub), we can start creating functions, and compile once in a while to get errors.

import SimpleJSON

data Doc = ToBeDefined
           deriving (Show)

string :: String -> Doc
string str = undefined

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined

-- HOWTO USE:
--
-- Prelude> :l PrettyStub.hs 
-- [1 of 2] Compiling SimpleJSON       ( SimpleJSON.hs, interpreted )
-- [2 of 2] Compiling Main             ( PrettyStub.hs, interpreted )
-- Ok, modules loaded: SimpleJSON, Main.
-- *Main> double 2.3
-- *** Exception: Prelude.undefined

