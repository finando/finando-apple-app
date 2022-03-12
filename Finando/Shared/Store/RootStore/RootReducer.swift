import ComposableArchitecture

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    accountsReducer
        .pullback(
            state: \.accounts,
            action: /RootAction.accounts,
            environment: {
                .init(
                    mainQueue: $0.mainQueue,
                    accountService: AccountService(apolloClient: $0.apolloClient)
                )
            }
        ),
    accountReducer
        .pullback(
            state: \.account,
            action: /RootAction.account,
            environment: {
                .init(
                    mainQueue: $0.mainQueue,
                    accountService: AccountService(apolloClient: $0.apolloClient)
                )
            }
        ),
    transactionsReducer
        .pullback(
            state: \.transactions,
            action: /RootAction.transactions,
            environment: {
                .init(
                    mainQueue: $0.mainQueue,
                    transactionsService: TransactionService(apolloClient: $0.apolloClient)
                )
            }
        )
)

extension Reducer {
    func relaying<Value>(
        _ path: CasePath<Action, Value>,
        to embed: @escaping (Value) -> Action
    ) -> Self {
        combined(
            with: Reducer { state, action, environment in
                if let value = path.extract(from: action) {
                    return Effect(value: embed(value))
                } else {
                    return .none
                }
            }
        )
    }
}
