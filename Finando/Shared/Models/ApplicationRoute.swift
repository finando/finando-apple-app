import Foundation

enum ApplicationRoute: String, CaseIterable, Equatable {
    case overview = "Overview"
    case accounts = "Accounts"
    case budget = "Budget"
    case goals = "Goals"
    case projections = "Projections"

    var path: String {
        switch self {
        case .overview:
            return "/"
        case .accounts:
            return "/accounts"
        case .budget:
            return "/budget"
        case .goals:
            return "/goals"
        case .projections:
            return "/projections"
        }
    }
}
