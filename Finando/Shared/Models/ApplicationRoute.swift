import Foundation

enum ApplicationRoute: Equatable, CaseIterable, Hashable {
    static var allCases: [ApplicationRoute] = [.overview, .accounts, .budget, .goals, .projections]

    case overview
    case accounts
    case account(String)
    case budget
    case goals
    case projections

    var path: String {
        switch self {
        case .overview:
            return "/"
        case .accounts:
            return "/accounts"
        case .account(let id):
            return "/accounts/\(id)"
        case .budget:
            return "/budget"
        case .goals:
            return "/goals"
        case .projections:
            return "/projections"
        }
    }

    var translation: String {
        switch self {
        case .overview:
            return "Overview"
        case .accounts:
            return "Accounts"
        case .account:
            return "Account"
        case .budget:
            return "Budget"
        case .goals:
            return "Goals"
        case .projections:
            return "Projections"
        }
    }
}
