import Foundation

struct TrackingAccount: Identifiable, Equatable {
    let id: String
    let name: String?
    let balance: Balance?
    let balances: [Balance]

    init(id: String, name: String? = nil, balance: Balance? = nil, balances: [Balance] = []) {
        self.id = id
        self.name = name
        self.balance = balance
        self.balances = balances
    }

    init(fragment: GetAccountAccountFragment.AsTrackingAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
            balances: fragment.balances.map({ Balance(fragment: $0.fragments.getAccountBalanceFragment) })
        )
    }

    init(fragment: ListAccountsAccountFragment.AsTrackingAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
        )
    }

    init(fragment: CreateTrackingAccountTrackingAccountFragment) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.createTrackingAccountBalanceFragment)
        )
    }

    init(fragment: DeleteTrackingAccountTrackingAccountFragment) {
        self.init(
            id: fragment.id
        )
    }
}
