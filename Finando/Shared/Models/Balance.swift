import Foundation

struct Balance: Equatable, Hashable {
    let date: Date
    var cleared: Int {
        didSet {
            running = cleared + uncleared
        }
    }
    var uncleared: Int {
        didSet {
            running = cleared + uncleared
        }
    }
    private(set) var running: Int
    let currency: String

    init(date: Date = Date(), cleared: Int = 0, uncleared: Int = 0, running: Int = 0, currency: String) {
        self.date = date
        self.cleared = cleared
        self.uncleared = uncleared
        self.running = running
        self.currency = currency
    }
}

extension Balance {
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
