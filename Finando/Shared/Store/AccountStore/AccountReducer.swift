import ComposableArchitecture

let accountReducer = Reducer<
    AccountState,
    AccountAction,
    AccountEnvironment
> { state, action, environment in
    switch action {
    case .getAccountRequested:
        state.isLoadingAccount = true

        return .none
    case .getAccountSucceeded:
        state.isLoadingAccount = false

        return .none
    case .getAccountFailed:
        state.isLoadingAccount = false

        return .none
    }
}
