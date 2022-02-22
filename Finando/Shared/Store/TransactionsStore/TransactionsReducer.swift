import ComposableArchitecture

let transactionsReducer = Reducer<
    TransactionsState,
    TransactionsAction,
    TransactionsEnvironment
> { state, action, environment in
    switch action {
    case .listTransactionsRequested(accountId: let accountId):
        state.transactions = []
        state.isLoadingTransactions = true

        return Effect
            .task { await environment.transactionsService.listTransactions(accountId: accountId) }
            .map { transactions in
                if !transactions.isEmpty {
                    return .listTransactionsSucceeded(transactions: transactions)
                }

                return .listTransactionsFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .listTransactionsSucceeded(transactions: let transactions):
        state.transactions = IdentifiedArray.init(uniqueElements: transactions, id: \.id)
        state.isLoadingTransactions = false

        return .none
    case .listTransactionsFailed:
        state.isLoadingTransactions = false

        return .none
    case .listScheduledTransactionsRequested(accountId: let accountId):
        state.scheduledTransactions = []
        state.isLoadingScheduledTransactions = true

        return Effect
            .task { await environment.transactionsService.listScheduledTransactions(accountId: accountId) }
            .map { transactions in
                if !transactions.isEmpty {
                    return .listScheduledTransactionsSucceeded(transactions: transactions)
                }

                return .listScheduledTransactionsFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .listScheduledTransactionsSucceeded(transactions: let transactions):
        state.scheduledTransactions = IdentifiedArray.init(uniqueElements: transactions, id: \.id)
        state.isLoadingScheduledTransactions = false

        return .none
    case .listScheduledTransactionsFailed:
        state.isLoadingScheduledTransactions = false

        return .none
    }
}
