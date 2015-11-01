-- Binary tree definition
--
-- Note: Empty and Node are new value constructors that we customly create for this tree.

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

-- how to instantiate a tree:
simpletree = Node "parent" (Node "left child" Empty Empty) (Node "right child" Empty Empty)
