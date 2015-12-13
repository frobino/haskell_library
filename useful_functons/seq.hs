-- The seq function exists solely as a way to force values to be evaluated,
-- i.e. a function containing seq is NOT lazily evaluated
-- For example, without seq, the foldl function would not evaluate all elements of the input list

foldl' _ accum [] = accum
foldl' step accum (x:xs) =
  let new_accum = step accum x
  in new_accum `seq` foldl' step new_accum xs

-- *Main> foldl' (+) 0 [1,2,3]
-- 6
