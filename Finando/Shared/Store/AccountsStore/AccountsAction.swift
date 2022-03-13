import class Foundation.NSDictionary

enum AccountsAction: Equatable {
    case listAccountsRequested
    case listAccountsSucceeded(accounts: [Account])
    case listAccountsFailed
    case createBudgetAccountRequested(data: CreateBudgetAccountInput)
    case createBudgetAccountSucceeded(account: Account)
    case createBudgetAccountFailed
    case createTrackingAccountRequested(data: CreateTrackingAccountInput)
    case createTrackingAccountSucceeded(account: Account)
    case createTrackingAccountFailed
    case deleteBudgetAccountRequested(id: Account.ID)
    case deleteBudgetAccountSucceeded(account: Account)
    case deleteBudgetAccountFailed
    case deleteTrackingAccountRequested(id: Account.ID)
    case deleteTrackingAccountSucceeded(account: Account)
    case deleteTrackingAccountFailed
    case updateAccountBalances(createdTransaction: Transaction? = nil, updatedTransaction: Transaction? = nil, deletedTransaction: Transaction? = nil)
}

extension CreateBudgetAccountInput: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        NSDictionary(dictionary: lhs.graphQLMap as [AnyHashable : Any])
            .isEqual(to: rhs.graphQLMap as [AnyHashable : Any])
    }
}

extension CreateTrackingAccountInput: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        NSDictionary(dictionary: lhs.graphQLMap as [AnyHashable : Any])
            .isEqual(to: rhs.graphQLMap as [AnyHashable : Any])
    }
}
