-- Struct in Haskell are implemented using datatypes with a single value constructor
--
-- struct book_info
-- {
--   int id;
--   char *name;
--   char **authors;
-- }
-- becomes:
data BookInfo = Book Int String [String]
              deriving (Show) 

-- how to read parameters through a functios/s
--
-- function 1
--
readID (Book id _ _) = id
-- function 2
--
readName (Book _ name _) = name
-- function 3
--
readAuthors (Book _ _ authors) = authors

-- Otherwise we can define the new datatype and its functions to read
-- the struct in the same piece of code

data BookInfo2 = Book2
                 {readID2 :: Int,
                  readName2 :: String,
                  readAuthors2 :: [String]
                 } deriving (Show) 
