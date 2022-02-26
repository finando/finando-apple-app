import IdentifiedCollections

struct TransactionsState: Equatable {
    var transactions: IdentifiedArrayOf<Transaction> = []
    var latestTransactions: IdentifiedArrayOf<Transaction> = []
    var scheduledTransactions: IdentifiedArrayOf<ScheduledTransaction> = []
    var hasMoreTransactions = false
    var isLoadingTransactions: Bool = false
    var isLoadingMoreTransactions: Bool = false
    var isLoadingScheduledTransactions: Bool = false
}
