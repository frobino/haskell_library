-- as-patterns are used to bind a variable (e.g. xs) to the value that matches the right side of the
-- @ symbol. For Example:

suffixes::[a]->[[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []

suffixes2::[a]->[[a]]
suffixes2 (x:xs) = (x:xs) : suffixes2 xs
suffixes2 _ = []

-- as-pattern can be used to reuse the xs value, so diminish allocation.
