protocol AccountServiceProtocol {
    func listAccounts() async -> [Account]
    func getAccount(id: String) async -> Account?
    func createBudgetAccount(data: CreateBudgetAccountInput) async -> Account?
    func createTrackingAccount(data: CreateTrackingAccountInput) async -> Account?
    func deleteBudgetAccount(id: String) async -> Account?
    func deleteTrackingAccount(id: String) async -> Account?
}
