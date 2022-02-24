struct RootState: Equatable {
    var accounts = AccountsState()
    var account = AccountState()
    var transactions = TransactionsState()
}
