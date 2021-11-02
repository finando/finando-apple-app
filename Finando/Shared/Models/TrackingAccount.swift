import Foundation

struct TrackingAccount: Identifiable {
    let id: String
    let name: String
    let balance: Balance
    
    init(account: AccountFragment.AsTrackingAccount) {
        self.id = account.id
        self.name = account.name ?? ""
        self.balance = Balance(balance: account.balance.fragments.balanceFragment)
    }
}
