-- the Main module is NEEDED to create an executable through "ghc <filename.hs>"
module Main where

import SimpleJSON

main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
