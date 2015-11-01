-- Pattern matching: define a function as a series of equations
--
-- It is good to have the pattern matched more often at the top beacuse evaluation is done from
-- top to bottom until a match
--
sumList_1 (x:xs) = sumList xs + x
sumList_1 []     = 0

--

sumList_2 (x:xs) = sumList xs + x
sumList_2 _      = 0
