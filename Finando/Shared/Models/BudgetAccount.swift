struct BudgetAccount: Identifiable, Equatable, Hashable {
    let id: String
    let name: String?
    let balance: Balance?
    let balances: [Balance]?

    init(id: String, name: String? = nil, balance: Balance? = nil, balances: [Balance]? = nil) {
        self.id = id
        self.name = name
        self.balance = balance
        self.balances = balances
    }
}
