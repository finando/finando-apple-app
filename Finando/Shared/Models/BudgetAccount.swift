import Foundation

struct BudgetAccount: Identifiable, Equatable, Hashable {
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

    init(fragment: GetAccountAccountFragment.AsBudgetAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
            balances: fragment.balances.map({ Balance(fragment: $0.fragments.getAccountBalanceFragment) })
        )
    }

    init(fragment: ListAccountsAccountFragment.AsBudgetAccount) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
        )
    }

    init(fragment: CreateBudgetAccountBudgetAccountFragment) {
        self.init(
            id: fragment.id,
            name: fragment.name ?? "",
            balance: Balance(fragment: fragment.balance.fragments.createBudgetAccountBalanceFragment)
        )
    }

    init(fragment: DeleteBudgetAccountBudgetAccountFragment) {
        self.init(
            id: fragment.id
        )
    }
}
