enum RootAction: Equatable {
    case accounts(AccountsAction)
    case account(AccountAction)
    case transactions(TransactionsAction)
}
