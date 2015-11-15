-- Usually recursion is used with an accumulator.
--
-- Example of a loop with dependency on a variable (acc) using C:
--
-- int as_int(char *str)
-- {
--   int acc; /*accumulate the partial result: accumulator*/
-- 
--   for (acc=0; isdigit(*str); str++){
--     acc = acc * 10 + (*str - 'O');
--   }
-- 
--   return acc;
-- }
--
-- How we implement the above loop using recursion in Haskell:

import Data.Char (digitToInt)

asInt :: String -> Int
asInt xs = loop 0 xs

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc *10 + digitToInt x
                  in loop acc' xs

