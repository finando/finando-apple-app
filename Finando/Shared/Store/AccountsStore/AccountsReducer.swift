import ComposableArchitecture

let accountsReducer = Reducer<
    AccountsState,
    AccountsAction,
    AccountsEnvironment
> { state, action, environment in
    switch action {
    case .listAccountsRequested:
        state.isLoadingAccounts = true

        return .none
    case .listAccountsSucceeded:
        state.isLoadingAccounts = false

        return .none
    case .listAccountsFailed:
        state.isLoadingAccounts = false

        return .none
    }
}
