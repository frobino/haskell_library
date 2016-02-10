----------------------------------------------------------------------------------------------------------
-- This file contains the definition of a new datatype JValue, and a set of functions that
-- reads a Jvalue and return a standard Haskell datatype
----------------------------------------------------------------------------------------------------------
--
-- A module let us determine which names inside the module are ACCESSIBLE from other modules
module SimpleJSON -- module name
    (
      JValue(..) -- each of these elements in the list are called exports
      -- In this specific export, the (..) indicates we are exporting the JValue type and all its constructors
    , getString
    , getInt
    , getDouble
    , getBool
    , getObject
    , getArray
    , isNull
    ) where -- from here on write the definition of all names inside the module
-- NOTE: if we omit the () with exports, ALL NAMES IN THE MODULE WILL BE EXPORTED BY DEFAULT

-- ALGEBRAIC DATATYPE (new datatype) to represent range of possible JSON types:
data JValue = JString String -- constructor #1
            | JNumber Double -- constructor #2...
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)

-- The following functions take a JValue and return it as a "standard" hHskell datatype:
--
getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _           = Nothing -- we match this case if we pass something different from JString 

getInt (JNumber n) = Just (truncate n) -- tuncate function turns a float or a rational into int dropping the digits after the decimal point
getInt _           = Nothing

getDouble (JNumber n) = Just n
getDouble _           = Nothing

getBool (JBool b) = Just b
getBool _         = Nothing

getObject (JObject o) = Just o
getObject _           = Nothing

getArray (JArray a) = Just a
getArray _          = Nothing

isNull v            = v == JNull
