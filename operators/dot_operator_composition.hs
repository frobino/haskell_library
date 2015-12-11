-- the . operator is used to compose functions:
--
-- Example 1:
import Data.List -- required for tails funcion
import Data.Char -- used for example 2

suffix_no_comp xs = init (tails xs)

suffix_yes_comp xs = (init . tails) xs

--Example 2
-- *Main> capitalLettersCount "Mannacc Cane"
capitalLettersCount xs = (length . filter (isUpper . head) . words) xs
