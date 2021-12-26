enum AccountAction: Equatable {
    case getAccountRequested(id: String)
    case getAccountSucceeded(account: Account)
    case getAccountFailed
}
