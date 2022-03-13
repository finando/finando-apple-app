final class TransactionServiceMock: TransactionServiceProtocol {
    let transactions: [Transaction]

    init(transactions: [Transaction] = []) {
        self.transactions = transactions
    }

    func listTransactions(accountId: Account.ID) async -> [Transaction] {
        return transactions
    }

    func listLatestTransactions(accountId: Account.ID, pagination: Pagination) async -> ([Transaction], Bool) {
        return (transactions, false)
    }

    func listScheduledTransactions(accountId: Account.ID) async -> [ScheduledTransaction] {
        return []
    }

    func createTransaction(data: CreateTransactionInput) async -> Transaction? {
        return nil
    }

    func deleteTransaction(id: Transaction.ID) async -> Transaction? {
        return nil
    }
}
