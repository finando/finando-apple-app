enum TransactionType: CaseIterable {
    case income
    case expense
    case transfer
}

extension TransactionType {
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

    var icon: String {
        switch self {
        case .income:
            return "arrow.forward.square"
        case .expense:
            return "arrow.backward.square"
        case .transfer:
            return "arrow.left.arrow.right.square"
        }
    }
}
