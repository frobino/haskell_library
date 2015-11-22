-- An HIGH ORDER FUNCTION is a function which takes another function as an argument.
-- See loops/map.hs: the map function is a high order function:
--
-- Prelude> :t map
-- map :: (a -> b) -> [a] -> [b]
--
-- NOTE: the symbol _ represent a WILDCARD
--
myMap :: (a->b) -> [a] -> [b]
myMap f (x:xs) = f x : myMap f xs
myMap _ _ = []
