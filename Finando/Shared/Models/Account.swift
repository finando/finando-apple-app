import Foundation

enum Account {
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
    var name: String {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.name
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.name
        }
    }
    var balance: Balance {
        switch self {
        case .BudgetAccount(let budgetAccount):
            return budgetAccount.balance
        case .TrackingAccount(let trackingAccount):
            return trackingAccount.balance
        }
    }
}
