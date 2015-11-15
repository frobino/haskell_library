-- map :
--    useful for embarassingly parallel loops. "map" takes a function and applies it to all
--    elements of a list.

-- square each element of a list in C:
--
-- void square(double *out, const double *in, size_t length){
--   for (size_t i=0; i < length; i++)
--     out[i] = in[i]*in[i];
-- }
--
-- Haskell using map
square_map :: [Double] -> [Double]
square_map xs = map square' xs
  where square' x = x*x

-- Haskell using recursion:

square_recurse :: [Double] -> [Double]
square_recurse [] = []
square_recurse (x:xs) = x*x : square_recurse xs
