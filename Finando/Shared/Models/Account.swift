import Foundation

class Account: Identifiable, Equatable, Hashable {
    let id: String
    let name: String?
    var balance: Balance? {
        didSet {
            revision = UUID()
        }
    }
    let balances: [Balance]?
    private(set) var revision: UUID = UUID()

    init(id: String, name: String? = nil, balance: Balance? = nil, balances: [Balance]? = nil) {
        self.id = id
        self.name = name
        self.balance = balance
        self.balances = balances
    }

    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Account {
    var typeIcon: String {
        switch self {
        case is BudgetAccount:
            return "chart.pie.fill"
        case is TrackingAccount:
            return "chart.bar.fill"
        default:
            return "questionmark.app"
        }
    }

    var typeTranslation: String {
        switch self {
        case is BudgetAccount:
            return "Budget"
        case is TrackingAccount:
            return "Tracking"
        default:
            return "Unknown"
        }
    }
}
