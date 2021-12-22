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
        formatToCurrencyValue(value: Double(uncleared) / 100, currency: currency)
    }

    var clearedFormatted: String {
        formatToCurrencyValue(value: Double(cleared) / 100, currency: currency)
    }

    var runningFormatted: String {
        formatToCurrencyValue(value: Double(running) / 100, currency: currency)
    }

    private func formatToCurrencyValue(value: Double, currency: String) -> String {
        let numberFormatter = NumberFormatter()

        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.decimalSeparator = "."
        numberFormatter.currencyDecimalSeparator = "."
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.currencyCode = currency
        numberFormatter.currencySymbol = currency

        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
}
