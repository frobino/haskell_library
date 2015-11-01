-- Enum in Haskell are implemented using datatypes with multiple value constructors (ALGEBRAIC DATATYPES)
--
-- enum roygbiv
-- {
--   red,
--   orange,
--   yellow
-- }
-- becomes:
data Roygbiv = Red
             | Orange
             | Yellow
               deriving (Eq,Show)
