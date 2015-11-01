-- Guards are used to make a check before evaluating a function's body
--
-- Note: each line starting with | is a guard

lend amount balance
  | amount <= 0 = Nothing
  | amount > reserve = Nothing
  | newBalance < 0 = Nothing
  | otherwise = Just newBalance
  where reserve = 100
        newBalance = balance - amount

-- from a NON guarded function...
myDrop_not_guarded n xs = if n <= 0 || null xs
                          then xs
                          else myDrop_not_guarded (n-1) (tail xs)

-- ...to a guarded function
myDrop_guarded n xs
  | n <= 0 = xs
myDrop_guarded _ [] = []
myDrop_guarded n (_:xs) = myDrop_guarded (n-1) xs
