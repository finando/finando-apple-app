import ComposableArchitecture

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    accountsReducer.pullback(
        state: \.accounts,
        action: /RootAction.accounts,
        environment: { _ in .init() }
    ),
    accountReducer.pullback(
        state: \.account,
        action: /RootAction.account,
        environment: { _ in .init() }
    )
)
