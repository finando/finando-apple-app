import SwiftUI
import SwiftUIRouter

struct AccountView: View {
    let accountId: String;
    
    @EnvironmentObject var navigator: Navigator

    @StateObject var accountViewModel = AccountViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            breadcrumbs
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)

            ScrollView {
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 100, alignment: Alignment(horizontal: .leading, vertical: .top))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)

                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 350, alignment: Alignment(horizontal: .leading, vertical: .top))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 1050, alignment: Alignment(horizontal: .leading, vertical: .top))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
            }
        }
        .onAppear(perform: { accountViewModel.setAccountId(accountId) })
    }

    private var breadcrumbs: some View {
        Breadcrumbs {
            Breadcrumb {
                Text("Overview")
                    .onTapGesture { navigator.navigate(ApplicationRoute.overview.path, replace: false) }
            }
            Breadcrumb {
                Text("Accounts")
                    .onTapGesture { navigator.navigate(ApplicationRoute.accounts.path, replace: false) }
            }
            Breadcrumb(active: true) {
                Text(accountViewModel.account?.name ?? "")
            }
        }
        .padding(.bottom, 8)
    }
}
