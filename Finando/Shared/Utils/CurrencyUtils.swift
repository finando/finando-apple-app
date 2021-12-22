import Foundation

enum CurrencyUtils {
    static func formatAsCurrency(value: Double, currency: String) -> String {
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
