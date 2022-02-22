import IdentifiedCollections

struct TransactionsState: Equatable {
    var transactions: IdentifiedArrayOf<Transaction> = []
    var scheduledTransactions: IdentifiedArrayOf<ScheduledTransaction> = []
    var isLoadingTransactions: Bool = false
    var isLoadingScheduledTransactions: Bool = false
}
