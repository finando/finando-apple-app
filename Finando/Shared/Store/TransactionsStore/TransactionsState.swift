import IdentifiedCollections

struct TransactionsState: Equatable {
    var transactions: IdentifiedArrayOf<Transaction> = []
    var latestTransactions: IdentifiedArrayOf<Transaction> = []
    var scheduledTransactions: IdentifiedArrayOf<ScheduledTransaction> = []
    var hasMoreTransactions = false
    var isLoadingTransactions: Bool = false
    var isLoadingLatestTransactions = false
    var isLoadingMoreLatestTransactions: Bool = false
    var isLoadingScheduledTransactions: Bool = false
    var isCreatingTransaction: Bool = false
}
