enum TransactionsAction: Equatable {
    case listTransactionsRequested(accountId: Account.ID)
    case listTransactionsSucceeded(transactions: [Transaction])
    case listTransactionsFailed
    case listLatestTransactionsRequested(accountId: Account.ID, pagination: Pagination)
    case listLatestTransactionsSucceeded(transactions: [Transaction], hasMore: Bool)
    case listLatestTransactionsFailed
    case listScheduledTransactionsRequested(accountId: Account.ID)
    case listScheduledTransactionsSucceeded(transactions: [ScheduledTransaction])
    case listScheduledTransactionsFailed
}
