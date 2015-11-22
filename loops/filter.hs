-- filter:
-- go through a list (for loop) and search (return) elements which satisfy a specific criteria

-- Example: given a list of numbers, generate a list of only odd numbers contained in the input list.
-- Pseudocode C:
--
-- void onlyOddElems(double *out, const double *in, size_t length){
--   for (size_t i=0; i < length; i++)
--     if (isOdd(in[i])){
--       out[i].addElem = in[i];
--     }
-- }

-- Haskell using filter:
oddList :: [Int] -> [Int]
oddList list = filter odd list

-- Haskell using recursion:
oddList_rec :: [Int] -> [Int]
oddList_rec (x:xs) | odd x = x : oddList_rec xs
                   | otherwise = oddList_rec xs
oddList_rec _ = []
