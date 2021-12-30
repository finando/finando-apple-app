import SwiftUI
import ComposableArchitecture

enum ApplicationTab: CaseIterable {
//    case overview
    case accounts

    var translation: String {
        switch self {
//        case .overview:
//            return "Overview"
        case .accounts:
            return "Accounts"
        }
    }

    var icon: String {
        switch self {
//        case .overview:
//            return "square.grid.2x2"
        case .accounts:
            return "banknote"
        }
    }

    func view(store: Store<RootState, RootAction>) -> some View {
        switch self {
//        case .overview:
//            return AnyView(OverviewView())
        case .accounts:
            return AnyView(
                AccountsView(
                    store: store.scope(
                        state: \.accounts,
                        action: RootAction.accounts
                    )
                )
            )
        }
    }
}
