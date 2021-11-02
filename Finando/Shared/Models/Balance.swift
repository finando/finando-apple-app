import Foundation

struct Balance {
    let date: Date?
    let cleared: Int
    let uncleared: Int
    let running: Int
    let currency: String
    
    init(balance: BalanceFragment) {
        self.date = ISO8601DateFormatter().date(from: balance.date)
        self.cleared = balance.cleared
        self.uncleared = balance.uncleared
        self.running = balance.running
        self.currency = balance.currency
    }
}
