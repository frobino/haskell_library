mySecond :: [a] -> a
mySecond xs = if null (tail xs)
              then error "list is too short"
              else head (tail xs)


