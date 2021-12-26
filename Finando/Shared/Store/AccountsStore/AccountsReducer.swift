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
        state.accounts = accounts
        state.isLoadingAccounts = false

        return .none
    case .listAccountsFailed:
        state.isLoadingAccounts = false

        return .none
    }
}
