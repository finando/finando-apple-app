final class TransactionServiceMock: TransactionServiceProtocol {
    let transactions: [Transaction]

    init(transactions: [Transaction] = []) {
        self.transactions = transactions
    }

    func listTransactions(accountId: String) async -> [Transaction] {
        return transactions
    }

    func listLatestTransactions(accountId: String, pagination: Pagination) async -> ([Transaction], Bool) {
        return (transactions, false)
    }

    func listScheduledTransactions(accountId: String) async -> [ScheduledTransaction] {
        return []
    }

    func createTransaction(data: CreateTransactionInput) async -> Transaction? {
        return nil
    }
}
