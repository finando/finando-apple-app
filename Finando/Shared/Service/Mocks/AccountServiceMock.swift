final class AccountServiceMock: AccountServiceProtocol {
    let accounts: [Account]

    init(accounts: [Account] = []) {
        self.accounts = accounts
    }

    func listAccounts() async -> [Account] {
        return accounts
    }

    func getAccount(id: Account.ID) async -> Account? {
        return nil
    }

    func createBudgetAccount(data: CreateBudgetAccountInput) async -> Account? {
        return nil
    }

    func createTrackingAccount(data: CreateTrackingAccountInput) async -> Account? {
        return nil
    }

    func deleteBudgetAccount(id: Account.ID) async -> Account? {
        return nil
    }

    func deleteTrackingAccount(id: Account.ID) async -> Account? {
        return nil
    }
}
