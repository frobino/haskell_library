-- foldr (see foldl too): 
-- do something to every element of a list, one element after the other. While we do it, we
-- update an accumulator using some kind of logic, and at the end we return the accumulator.
--
-- The fold goes through list, and evaluates all elements of the input list thorugh a
-- custom function, which uses the accumulator and returns the same type of the accumulator.

-- NOTE: we start applying the input function to the "right-est" element of the list, for example:

-- foldr (+) 0 [1:2:3:[]] is evaluated as the following steps:
--       == (3+0) -> new accumulator = 3 (NOTE: accumulator, in this case 0, is always right)
--       == (2+3) -> new accumulator = 5
--       == (1+5) -> new accumulator = 6
--       == ([]+6) -> 6, return
--
--       == 1 + ( 2 + (3 + 0)) where 0 and () indicate the accumulator (-> accumulator on the right)

-- if we were using foldl (+) 0 [1:2:3:[]], it will evaluate as the following steps:
-- foldl (+) 0 [1:2:3:[]] is evaluated as the following steps:
--       == (0+1) -> new accumulator = 1 (NOTE: accumulator, in this case 0, is always left)
--       == (1+2) -> new accumulator = 3
--       == (3+3) -> new accumulator = 6
--       == (6+[]) -> 6, return
--
--       == ((0 + 1) + 2) + 3 where 0 and () indicate the accumulator (-> accumulator on the left)
--
--
-- NOTE2: every fold returns the same type of its accumulator! See Example 2, where foldl returns (a,b)

-- Example:
-- sum all emements of a list

sumFoldR :: [Integer] -> Integer
sumFoldR list = foldr (+) 0 list

-- Example 2:
-- implement the "filter" loop/function using foldr

myFilter_foldr :: (a -> Bool) -> [a] -> [a]
myFilter_foldr boolean_func xs = foldr step [] xs -- where [] is the initial value of the accumulator
  where step x accumulator | boolean_func x = x : accumulator
                           | otherwise = accumulator
