import Foundation

struct BudgetAccount: Identifiable {
    let id: String
    let name: String
    let balance: Balance
    let balances: [Balance]

    init(id: String, name: String, balance: Balance, balances: [Balance] = []) {
        self.id = id
        self.name = name
        self.balance = balance
        self.balances = balances
    }

    init(fragment: GetAccountAccountFragment.AsBudgetAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.balanceFragment),
            balances: fragment.balances.map({ Balance(fragment: $0.fragments.balanceFragment) })
        )
    }

    init(fragment: ListAccountsAccountFragment.AsBudgetAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.balanceFragment)
        )
    }
}
