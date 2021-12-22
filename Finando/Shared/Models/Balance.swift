import Foundation

struct Balance {
    let date: Date
    let cleared: Int
    let uncleared: Int
    let running: Int
    let currency: String

    init(date: Date, cleared: Int, uncleared: Int, running: Int, currency: String) {
        self.date = date
        self.cleared = cleared
        self.uncleared = uncleared
        self.running = running
        self.currency = currency
    }
    
    init(currency: String) {
        self.init(
            date: Date(),
            cleared: 0,
            uncleared: 0,
            running: 0,
            currency: currency
        )
    }

    init(fragment: BalanceFragment) {
        self.init(
            date: ISO8601DateFormatter().date(from: fragment.date) ?? Date(),
            cleared: fragment.cleared,
            uncleared: fragment.uncleared,
            running: fragment.running,
            currency: fragment.currency
        )
    }

    var unclearedFormatted: String {
        CurrencyUtils.formatAsCurrency(value: Double(uncleared) / 100, currency: currency)
    }

    var clearedFormatted: String {
        CurrencyUtils.formatAsCurrency(value: Double(cleared) / 100, currency: currency)
    }

    var runningFormatted: String {
        CurrencyUtils.formatAsCurrency(value: Double(running) / 100, currency: currency)
    }
}
