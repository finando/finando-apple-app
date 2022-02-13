import Foundation

enum Account: Equatable, Hashable {
    case BudgetAccount(BudgetAccount)
    case TrackingAccount(TrackingAccount)
}

extension Account: Identifiable {
    var id: String {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.id
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.id
        }
    }

    var name: String? {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.name
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.name
        }
    }

    var balance: Balance? {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.balance
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.balance
        }
    }

    var balances: [Balance] {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.balances
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.balances
        }
    }

    var isBudgetAccount: Bool {
        switch self {
        case .BudgetAccount:
            return true
        default:
            return false
        }
    }

    var isTrackingAccount: Bool {
        switch self {
        case .TrackingAccount:
            return true
        default:
            return false
        }
    }

    var typeIcon: String {
        switch self {
        case .BudgetAccount:
            return "chart.pie.fill"
        case .TrackingAccount:
            return "chart.bar.fill"
        }
    }

    var typeTranslation: String {
        switch self {
        case .BudgetAccount:
            return "Budget"
        case .TrackingAccount:
            return "Tracking"
        }
    }
}
