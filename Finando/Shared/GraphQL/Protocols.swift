protocol AccountFragment: Identifiable {}

protocol BalanceFragment {
    var date: String { get }
    var cleared: Int { get }
    var uncleared: Int { get }
    var running: Int { get }
    var currency: String { get }
}

protocol TransactionFragment {}

protocol ScheduledTransactionFragment {}

protocol EntryFragment {
    var id: String { get }
    var account: String { get }
    var debit: String { get }
    var credit: String { get }
    var currency: String { get }
}
