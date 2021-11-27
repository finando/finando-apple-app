import Foundation

struct TrackingAccount: Identifiable {
    let id: String
    let name: String
    let balance: Balance

    init(id: String, name: String, balance: Balance) {
        self.id = id
        self.name = name
        self.balance = balance
    }

    init(fragment: AccountFragment.AsTrackingAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.balanceFragment)
        )
    }
}
