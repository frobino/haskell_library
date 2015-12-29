-- Typeclasses are used when we want to overload a specific function/operator.
-- For example, we want to use == to compare our new datatype called Color.
-- Instead of implementing a new function to compare two Color variables, we can overload == to do so.
--
-- Typeclasses share many concepts with objects in OOP, but they are not completely the same.
--
-- When running :type, typeclasses are the ones in parenthesis coming after :: and before =>
-- Important examples of typeclasses are:
--   * Eq
--   * Show
--   * Read

-- define a new datatype Color
data Color = Red | Green | Blue

-- declare a new Typeclass called BasicEq3 using the keyword "class"
-- NOTE: the BasicEq3 tyoeclass provide 2 "methods" called isEqual3 and isNotequal3
class BasicEq3 a where
  isEqual3 :: a -> a -> Bool
  isEqual3 x y = not (isNotEqual3 x y)

  isNotEqual3 :: a -> a -> Bool
  isNotEqual3 x y = not (isEqual3 x y)
-- now I need to implement at least one of the two methods (isEqual3 or isNotequal3)
--
-- the isEqual "method" is implemented using the keyword "instance"
instance BasicEq3 Color where -- NOTE: I make the datatype Color a member of the Basiceq3 (Type)class. 
  isEqual3 Red Red = True
  isEqual3 Green Green = True
  isEqual3 Blue Blue = True
  isEqual3 _ _ = False

-- HOWTO RUN:
-- *Main> :type isEqual3
-- isEqual3 :: BasicEq3 a => a -> a -> Bool
-- *Main> isEqual3 Red Red
-- True

-- Use == (from Typeclass Eq) to compare our new datatype Color:
-- I make the datatype Color a member of the Eq (Type)class (in fact == is a method of Eq), and I implement ==
instance Eq Color where
  (==) Red Red = True
  (==) Green Green = True
  (==) Blue Blue = True
  (==) _ _ = False

-- HOWTO RUN:
-- *Main> :type (==)
-- (==) :: Eq a => a -> a -> Bool
-- *Main> Red == Red
-- True

-- Use "show" (from Typeclass Show) to print the Color datatype as a String
-- I make the datatype Color a member of the Show (Type)class, and I implement show
instance Show Color where
  show Red = "Red"
  show Green = "Green"
  show Blue = "Blue"

-- HOWTO RUN:
-- *Main> show Blue
-- "Blue"

-- Use "read" (from Typeclass Read) to do the opposite as show:
-- read a String, parse it, and return data in any type that is a member of Read (in this case, Color)
-- I make the datatype Color a member of the Read (Type)class, and I implement read (well, in this
-- case I implement readsPrec, which is the main function for parsing input)
instance Read Color where
  readsPrec _ value = tryParse [("Red",Red),("Green",Green),("Blue",Blue) ]
    where tryParse [] = [] -- if readsPrec returns a empty list, read fails
          tryParse ((attempt,result):xs) =
            if (take (length attempt) value) == attempt
            then [(result, drop (length attempt) value)] -- match found: stop recursion and return the
                                                       -- Color result (e.g. Red) and the remaining input
            else tryParse xs    -- match not found, continue tryParse

-- HOWTO RUN:
-- *Main> (read "Green")::Color
-- Green
  
-- NOTE:
-- for simple datatypes, instead of doing what I did now,
-- i.e. implementing manually the methods (e.g. == for Color), I can try to use automatic derivation:
--
-- data Color = Red | Green | Blue
--            deriving (Eq)
