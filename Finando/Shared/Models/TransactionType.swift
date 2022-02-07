enum TransactionType: CaseIterable {
    case income
    case expense
    case transfer

    var translation: String {
        switch self {
        case .income:
            return "Income"
        case .expense:
            return "Expense"
        case .transfer:
            return "Transfer"
        }
    }
}
