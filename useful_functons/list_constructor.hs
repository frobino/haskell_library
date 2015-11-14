-- The list constructor OPERATOR is used to concatenate elements in a list

splitLines [] = []
splitLines cs =
  let (pre,suf) = break isLineTerminator cs
  in pre : case suf of
            ('\n':rest) -> splitLines rest
            _           -> []

isLineTerminator c = c == '\n'
