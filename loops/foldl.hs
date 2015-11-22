-- foldl:
-- do something to every element of a list, one element after the other. While we do it, we
-- update an accumulator using some kind of logic, and at the end we return the accumulator.
--
-- The fold goes through list, and evaluates all elements of the input list thorugh a
-- custom function, which uses the accumulator and returns the same type of the accumulator.

-- NOTE: we start applying the input function to the "left-est" element of the list, for example:
-- foldl (+) 0 [1:2:3:[]] is evaluated as the following steps:
--       == (0+1) -> new accumulator = 1 (NOTE: accumulator, in this case 0, is always left)
--       == (1+2) -> new accumulator = 3
--       == (3+3) -> new accumulator = 6
--       == (6+[]) -> 6, return
--
--       == ((0 + 1) + 2) + 3 where 0 and () indicate the accumulator (-> accumulator on the left)
--
-- if we were using foldr (+) 0 [1:2:3:[]], it will evaluate as the following steps:
--       == (3+0) -> new accumulator = 3 (NOTE: accumulator, in this case 0, is always right)
--       == (2+3) -> new accumulator = 5
--       == (1+5) -> new accumulator = 6
--       == ([]+6) -> 6, return
--
--       == 1 + ( 2 + (3 + 0)) where 0 and () indicate the accumulator (-> accumulator on the right)
--
-- NOTE2: every fold returns the same type of its accumulator! See Example 2, where foldl returns (a,b)

-- import used in Example 2
import Data.Char (ord) -- convert char to ascii dec (e.g. 'a' -> 96) 
import Data.Bits (shiftL, (.&.), (.|.)) -- bitwise "and" and "or"

-- Example:
-- sum all emements of a list

sumFoldL :: [Integer] -> Integer
sumFoldL list = foldl (+) 0 list

-- Example 2:
-- Adler 32 checksum: a 32 bit checksum, composed by 2 sub-checksum:
--   * LSB 16 bits, 1st sub-checksum: the sum of all input bytes + 1 (the result is then computed modulo 65521)
--   * MSB 16 bits, 2nd sub-checksum: the sum of all 1st-checksum values (the result is then computed modulo 65521)
--
-- Alder32 checksum in pseudo C.
-- void Alder32(byte *data, size_t offset, size_t length){
--   int a = 1; // initial accumulator of 1st sub-checksum
--   int b = 0; // initial accumulator of 2nd sub-checksum
--
--   for (size_t i=0; i < offset+length; i++){
--     a = (a + (data[i] && 0xff)) % 65521; // 1st sub-checksum
--     b = (a + b) % 65521; // 2nd sub-checksum
--   }
--
-- return (b << 16) | a; // put the 2nd-checksum (accumulated in b) in the MSB 16 bits,
--                       // and put the 1st sub-checksum (accumulated in a) in the LSB 16 bits
-- }

-- *Main> adler32_foldl "hello"
adler32_foldl xs = let (a,b) = foldl step (1,0) xs -- initial values for accumulators
                         in (b `shiftL` 16) .|. a -- put the 2nd-checksum (accumulated in b) in the MSB 16 bits,
                            -- and put the 1st sub-checksum (accumulated in a) in the LSB 16 bits
  where step (a,b) x = let a' = a + (ord x .&. 0xff)
                       in (a' `mod` 65521, (a' + b) `mod` 65521) -- 1st and 2nd checksums
