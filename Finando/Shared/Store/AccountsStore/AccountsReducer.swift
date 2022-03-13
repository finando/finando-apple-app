import ComposableArchitecture

let accountsReducer = Reducer<
    AccountsState,
    AccountsAction,
    AccountsEnvironment
> { state, action, environment in
    switch action {
    case .listAccountsRequested:
        state.accounts = []
        state.isLoadingAccounts = true

        return Effect
            .task { await environment.accountService.listAccounts() }
            .map { accounts in
                if !accounts.isEmpty {
                    return .listAccountsSucceeded(accounts: accounts)
                }

                return .listAccountsFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .listAccountsSucceeded(accounts: let accounts):
        state.accounts = IdentifiedArray.init(uniqueElements: accounts, id: \.id)
        state.isLoadingAccounts = false

        return .none
    case .listAccountsFailed:
        state.isLoadingAccounts = false

        return .none
    case .createBudgetAccountRequested(data: let data):
        state.isCreatingAccount = true

        return Effect
            .task { await environment.accountService.createBudgetAccount(data: data) }
            .map { account in
                if let account = account {
                    return .createBudgetAccountSucceeded(account: account)
                }

                return .createBudgetAccountFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .createBudgetAccountSucceeded(account: let account):
        state.accounts.append(account)
        state.isCreatingAccount = false

        return .none
    case .createBudgetAccountFailed:
        state.isCreatingAccount = false

        return .none
    case .createTrackingAccountRequested(data: let data):
        state.isCreatingAccount = true

        return Effect
            .task { await environment.accountService.createTrackingAccount(data: data) }
            .map { account in
                if let account = account {
                    return .createTrackingAccountSucceeded(account: account)
                }

                return .createTrackingAccountFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .createTrackingAccountSucceeded(account: let account):
        state.accounts.append(account)
        state.isCreatingAccount = false

        return .none
    case .createTrackingAccountFailed:
        state.isCreatingAccount = false

        return .none
    case .deleteBudgetAccountRequested(id: let id):
        state.isDeletingAccount = true

        return Effect
            .task { await environment.accountService.deleteBudgetAccount(id: id) }
            .map { account in
                if let account = account {
                    return .deleteBudgetAccountSucceeded(account: account)
                }

                return .deleteBudgetAccountFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .deleteBudgetAccountSucceeded(account: let account):
        state.accounts.remove(account)
        state.isDeletingAccount = false

        return .none
    case .deleteBudgetAccountFailed:
        state.isDeletingAccount = false

        return .none
    case .deleteTrackingAccountRequested(id: let id):
        state.isDeletingAccount = true

        return Effect
            .task { await environment.accountService.deleteTrackingAccount(id: id) }
            .map { account in
                if let account = account {
                    return .deleteTrackingAccountSucceeded(account: account)
                }

                return .deleteTrackingAccountFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .deleteTrackingAccountSucceeded(account: let account):
        state.accounts.remove(account)
        state.isDeletingAccount = false

        return .none
    case .deleteTrackingAccountFailed:
        state.isDeletingAccount = false

        return .none
    case .updateAccountBalances(createdTransaction: let createdTransaction, updatedTransaction: let updatedTransaction, deletedTransaction: let deletedTransaction):
        createdTransaction?.entries.forEach { state.accounts[id: $0.account]?.balance?.cleared += ($0.debit - $0.credit) }
        deletedTransaction?.entries.forEach { state.accounts[id: $0.account]?.balance?.cleared -= ($0.debit - $0.credit) }

        return .none
    }
}
