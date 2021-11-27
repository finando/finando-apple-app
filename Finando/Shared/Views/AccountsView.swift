import SwiftUI

struct AccountsView: View {
    @StateObject var accountsViewModel = AccountsViewModel()

    var body: some View {
        VStack(spacing: 0) {
            ForEach(accountsViewModel.accounts, id: \.id) { account in
                LazyVStack(alignment: .leading, spacing: 0) {
                    AccountListItemView(account: account)
                        .padding(.vertical, 8)
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
