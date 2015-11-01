lend amount balance =  if balance < reserve
                       then Nothing
                       else Just newBalance
  where reserve = 100
        newBalance = balance - amount
                      
