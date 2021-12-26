enum AccountsAction: Equatable {
    case listAccountsRequested
    case listAccountsSucceeded(accounts: [Account])
    case listAccountsFailed
}
