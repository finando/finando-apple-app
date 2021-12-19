import SwiftUI
import SwiftUIRouter

struct AccountsView: View {
    @EnvironmentObject var navigator: Navigator

    @StateObject var accountsViewModel = AccountsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            breadcrumbs

            VStack(spacing: 0) {
                ForEach(accountsViewModel.accounts, id: \.id) { account in
                    LazyVStack(alignment: .leading, spacing: 0) {
                        AccountListItemView(account: account)
                            .padding(.vertical, 8)
                            .onTapGesture { navigator.navigate(ApplicationRoute.account(account.id).path, replace: false) }
                    }
                }
            }
        }
        .padding(16)
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
        .padding(.bottom, 8)
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
