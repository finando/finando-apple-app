import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

struct AccountsView: View {
    let store: Store<AccountsState, AccountsAction>

    @EnvironmentObject var navigator: Navigator

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            breadcrumbs
                .padding(16)

            WithViewStore(store) { viewStore in
                VStack(spacing: 0) {
                    ForEach(viewStore.accounts) { account in
                        LazyVStack(alignment: .leading, spacing: 0) {
                            AccountListItemView(account: account)
                                .padding(.vertical, 8)
                                .onTapGesture { navigator.navigate(ApplicationRoute.account(account.id).path, replace: false) }
                        }
                    }

                }
                .padding(.horizontal, 16)
                .onAppear { viewStore.send(.listAccountsRequested) }
            }
        }
    }

    private var breadcrumbs: some View {
        Breadcrumbs {
            Breadcrumb {
                Text("Overview")
                    .onTapGesture { navigator.navigate(ApplicationRoute.overview.path, replace: false) }
            }
            Breadcrumb(active: true) {
                Text("Accounts")
            }
        }
    }
}
