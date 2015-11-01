lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

bar = let x = 1
      in ((let x = "foo" in x),x)
