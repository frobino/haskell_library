-- Classic lists can be used with [] (see README).
-- Here we present a custom list created with recursion.
--
-- Note: Cons and Nil are "our" datatypes to define consecutive and null

data List a = Cons a (List a)
            | Nil
              deriving (Show)

-- The following commands:
--   Cons 0 Nil
--   Cons 1 it
--   Cons 2 it
--   ...
-- create a List
