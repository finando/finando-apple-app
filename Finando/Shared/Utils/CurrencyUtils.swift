import Foundation

enum CurrencyUtils {
    static func getCurrencyFormatter(decimalPlaces: Int = 2, currency: String? = nil) -> NumberFormatter {
        let numberFormatter = NumberFormatter()

        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.decimalSeparator = decimalPlaces > 0 ? "." : ""
        numberFormatter.currencyDecimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces

        if let currency = currency {
            numberFormatter.numberStyle = .currency
            numberFormatter.currencyCode = currency
            numberFormatter.currencySymbol = currency
        }

        return numberFormatter
    }

    static func formatAsCurrency(value: Double, currency: String) -> String {
        return getCurrencyFormatter(currency: currency).string(from: NSNumber(value: value)) ?? ""
    }
}
