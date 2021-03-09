require'privateBank'

myOwnBank = Bank.new(nil,'Jimmy')
-- Bank = nil -- only effects the new banks
herBank = Bank.new(55,'Jenny') -- attempt to index global 'Bank' (a nil value) if Bank is nilled

myOwnBank.deposit(5)
myOwnBank.withdraw(1)
myOwnBank.showBalance()


function myOwnBank:loan()
    print('Loaning user is:',self.account)
end


myOwnBank:loan()