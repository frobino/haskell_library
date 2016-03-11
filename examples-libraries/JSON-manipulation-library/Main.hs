-- the Main module is NEEDED to create an executable through "ghc <filename.hs>"
--
-- NOTE: "print" is a std function in the std lib in Haskell, and we can print JOblects (which is of type JValue)
--       becase JValue has been derived from Show (see SimpleJSON.hs)

module Main where

import SimpleJSON

main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
