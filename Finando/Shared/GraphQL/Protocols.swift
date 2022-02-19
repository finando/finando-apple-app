protocol AccountFragment: Identifiable {}

protocol BalanceFragment {
    var date: String { get }
    var cleared: Int { get }
    var uncleared: Int { get }
    var running: Int { get }
    var currency: String { get }
}
