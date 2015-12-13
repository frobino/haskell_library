-- the . operator is used to compose functions:
--
-- Example 1:
import Data.List -- required for tails function and Exmple 3
import Data.Char -- used for example 2

suffix_no_comp xs = init (tails xs)

suffix_yes_comp xs = (init . tails) xs

-- Example 2
-- *Main> capitalLettersCount "Mannacc Cane"
-- reurns 2 (because we have only 2 capital letters in the phrase
capitalLettersCount xs = (length . filter (isUpper . head) . words) xs

-- Example 3
-- grep from a header file only some specific names of some defines.
-- For example, given:
-- #define DLT_1 1 /'define #1*/
-- #define DLT_2 2 /'define #2*/
-- #define HAL_1 1 /'define #1*/
-- #define DLT_3 3 /'define #3*/
--
-- we want to print out all names of defines staring with DLT
--
-- NOTE the use of a step function, very common pattern in HASKELL
--
dlts :: String -> [String]
dlts = foldr step [] . lines -- note [] is the initial value for the accumulator in foldr
  where step firstline accumulator
          | "#define DLT_" `isPrefixOf` firstline = secondWord firstline : accumulator
          | otherwise = accumulator
        secondWord = head . tail . words -- function to return the 2nd word inside of 1st_line,
                     -- for example, if 1st_line is "#define DLT_1 1 /'define #1", it returns
                     -- DLT_1
-- *Main> dlts "#define HA 1 // random\n#define DLT_2 2 /'define #2*/\n"
-- ["DLT_2"]
