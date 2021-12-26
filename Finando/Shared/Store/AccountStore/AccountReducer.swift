import ComposableArchitecture

let accountReducer = Reducer<
    AccountState,
    AccountAction,
    AccountEnvironment
> { state, action, environment in
    switch action {
    case .getAccountRequested(id: let id):
        state.account = nil
        state.isLoadingAccount = true

        return Effect
            .task { await environment.accountService.getAccount(id: id) }
            .map { account in
                if let account = account {
                    return .getAccountSucceeded(account: account)
                }

                return .getAccountFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .getAccountSucceeded(account: let account):
        state.account = account
        state.isLoadingAccount = false

        return .none
    case .getAccountFailed:
        state.isLoadingAccount = false

        return .none
    }
}
