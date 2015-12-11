-- Lambda functions a.k.a. anonymous functions:
-- if we do not want to give a name to a helper function, we can declare it "inline",
-- without a name -> anonymous
--
-- used mainy for glue logic.
-- defined by \ symbol

isInAny_no_lambda needle haystack = any inSequence haystack
  where inSequence s = needle `isInfixOf` s

isInAny_yes_lambda needle haystack = any (\s->needle `isInfixOf` s) haystack
