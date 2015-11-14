------------------------------------------------------------------------------------------------
-- do KEYWORD
------------------------------------------------------------------------------------------------
--
-- The do keyword introduces a block of "sequential actions" that can cause effect in the real
-- world. For example IOs...
--
-- Example of a function taking data from a file and applying a function on it, and save to
-- another file:

------------------------------------------------------------------------------------------------
-- <- OPERATOR
------------------------------------------------------------------------------------------------
--
-- is the wquivalent of assignment inside a do block
--

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile -- readFile is provided by System.Environment
  writeFile outputFile (function input)

main = mainWith myFunction
  where mainWith function = do -- [where 1] define what mainwith is
          args <- getArgs
          case args of
           [input, output] -> interactWith function input output
           _ -> putStrLn "error: exact 2 arguments are needed"
        myFunction = id -- [where 2] define what myFunction is
