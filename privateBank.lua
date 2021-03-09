Bank = {}

function Bank.new(initialBalance, accountName)
    local members = {
        account = accountName or 'Anonymous',
        balance = initialBalance or 0,
    }
    local publicMembers = {
    }

    local withdraw = function(winthdrawAmount)
        members.balance = members.balance - winthdrawAmount
    end

    local deposit = function(depositAmount)
        members.balance = members.balance + depositAmount
    end

    local getBalance = function()
        return members.balance
    end

    local showBalance = function()
        print('left balance is:', getBalance())
    end
    return {
        withdraw = withdraw,
        deposit = deposit,
        showBalance = showBalance,
        account = members.account
    }
end

