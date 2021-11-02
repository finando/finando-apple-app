import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel: AccountViewModel
    
    var body: some View {
        VStack {
            Text("Account ID: \(accountViewModel.account?.id ?? "")")
            Text("Account name: \(accountViewModel.account?.name ?? "")")
        }
        .background(Color.red)
    }
}
