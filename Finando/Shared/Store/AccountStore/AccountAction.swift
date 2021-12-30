enum AccountAction: Equatable {
    case getAccountRequested(id: Account.ID)
    case getAccountSucceeded(account: Account)
    case getAccountFailed
}
