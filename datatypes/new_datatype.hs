-- * use the data keyword
-- * Capital letter for the new datatype
--
-- NOTE: the "value constructor" Book, and the "type constructor" BookInfo
-- can have the same name (it is usually so)
--
data BookInfo = Book Int String [String]
              deriving (Show) 

-- ALGEBRAIC DATA TYPES can have more than one value constructor
--
-- *Main> :type CreditCard 
-- CreditCard :: CardNumber -> CardHolder -> Address -> BillingInfo
-- *Main> :type CashOnDelivery 
-- CashOnDelivery :: BillingInfo
-- *Main> :type Invoice 
-- Invoice :: CustomerID -> BillingInfo

type CardHolder = String
type CardNumber= String
type Address = [String]
type CustomerID = Int

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
