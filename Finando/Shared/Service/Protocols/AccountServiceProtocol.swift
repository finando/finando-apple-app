protocol AccountServiceProtocol {
    func listAccounts() async -> [Account]
    func getAccount(id: Account.ID) async -> Account?
    func createBudgetAccount(data: CreateBudgetAccountInput) async -> Account?
    func createTrackingAccount(data: CreateTrackingAccountInput) async -> Account?
    func deleteBudgetAccount(id: Account.ID) async -> Account?
    func deleteTrackingAccount(id: Account.ID) async -> Account?
}
