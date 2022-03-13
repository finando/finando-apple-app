protocol TransactionServiceProtocol {
    func listTransactions(accountId: Account.ID) async -> [Transaction]
    func listLatestTransactions(accountId: Account.ID, pagination: Pagination) async -> ([Transaction], Bool)
    func listScheduledTransactions(accountId: Account.ID) async -> [ScheduledTransaction]
    func createTransaction(data: CreateTransactionInput) async -> Transaction?
    func deleteTransaction(id: Transaction.ID) async -> Transaction?
}
