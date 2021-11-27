import SwiftUI

struct AccountsView: View {
    @StateObject var accountsViewModel = AccountsViewModel()

    var body: some View {
//        HStack {
//            VStack {
//                Rectangle()
//                    .background(Color.red)
//                    .frame(width: 40, height: 40, alignment: .center)
//                
//                Rectangle()
//                    .background(Color.red)
//                    .frame(width: 40, height: 40, alignment: .center)
//                
//                Rectangle()
//                    .background(Color.red)
//                    .frame(width: 40, height: 40, alignment: .center)
//                
//                Rectangle()
//                    .background(Color.red)
//                    .frame(width: 40, height: 40, alignment: .center)
//            }
//            .frame(width: 85)
//            .frame(maxHeight: .infinity, alignment: .top)
//            .background(
//                ZStack {
//                    Color.white
//                        .padding(.trailing, 30)
//                    
//                    Color.white
//                        .cornerRadius(10)
//                        .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 0)
//                }
//            )
//        }
//        .frame(width: 500, height: 500, alignment: .leading)
//        .background(Color.white.ignoresSafeArea())
        
        List(accountsViewModel.accounts) { account in
            NavigationView {
                NavigationLink(destination: AccountView(accountViewModel: AccountViewModel(accountId: account.id))) {
                    HStack {
                        Text(account.id)
                        Text(account.name)
                        Text(String(account.balance.running))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
