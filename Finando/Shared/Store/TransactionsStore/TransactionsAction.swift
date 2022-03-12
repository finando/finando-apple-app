import class Foundation.NSDictionary

enum TransactionsAction: Equatable {
    case listTransactionsRequested(accountId: Account.ID)
    case listTransactionsSucceeded(transactions: [Transaction])
    case listTransactionsFailed
    case listLatestTransactionsRequested(accountId: Account.ID, pagination: Pagination)
    case listLatestTransactionsSucceeded(transactions: [Transaction], hasMore: Bool)
    case listLatestTransactionsFailed
    case loadMoreLatestTransactionsRequested(accountId: Account.ID, pagination: Pagination)
    case loadMoreLatestTransactionsSucceeded(transactions: [Transaction], hasMore: Bool)
    case loadMoreLatestTransactionsFailed
    case listScheduledTransactionsRequested(accountId: Account.ID)
    case listScheduledTransactionsSucceeded(transactions: [ScheduledTransaction])
    case listScheduledTransactionsFailed
}

extension CreateTransactionInput: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        NSDictionary(dictionary: lhs.graphQLMap as [AnyHashable : Any])
            .isEqual(to: rhs.graphQLMap as [AnyHashable : Any])
    }
}
