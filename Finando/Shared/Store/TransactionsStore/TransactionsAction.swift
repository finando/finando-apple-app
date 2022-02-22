enum TransactionsAction: Equatable {
    case listTransactionsRequested(accountId: Account.ID)
    case listTransactionsSucceeded(transactions: [Transaction])
    case listTransactionsFailed
    case listScheduledTransactionsRequested(accountId: Account.ID)
    case listScheduledTransactionsSucceeded(transactions: [ScheduledTransaction])
    case listScheduledTransactionsFailed
}
