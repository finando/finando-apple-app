protocol TransactionServiceProtocol {
    func listTransactions(accountId: String) async -> [Transaction]
    func listLatestTransactions(accountId: String, pagination: Pagination) async -> ([Transaction], Bool)
    func listScheduledTransactions(accountId: String) async -> [ScheduledTransaction]
    func createTransaction(data: CreateTransactionInput) async -> Transaction?
    func deleteTransaction(id: Transaction.ID) async -> Transaction?
}
