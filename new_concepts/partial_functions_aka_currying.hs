-- ParTial functions application a.k.a. currying is when we pass fewer arguments to a function than the function
-- can accept.
--
-- :t zip3
-- >> zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]

zip3Foo = zip3 "foo" 

--
-- :t zip3foo
-- zip3Foo :: [b] -> [c] -> [(Char, b, c)]

-- Another type of partial function application is called "section"
mul3All_1 :: [Int] -> [Int]
mul3All_1 list1 = map (*5) list1

mul3All_2 :: [Int] -> [Int]
mul3All_2 list1 = map (5*) list1
