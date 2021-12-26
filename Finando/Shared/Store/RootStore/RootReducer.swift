import ComposableArchitecture

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    accountsReducer.pullback(
        state: \.accounts,
        action: /RootAction.accounts,
        environment: {
            .init(
                mainQueue: $0.mainQueue,
                accountService: AccountService(apolloClient: $0.apolloClient)
            )
        }
    ),
    accountReducer.pullback(
        state: \.account,
        action: /RootAction.account,
        environment: {
            .init(
                mainQueue: $0.mainQueue,
                accountService: AccountService(apolloClient: $0.apolloClient)
            )
        }
    )
)
