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
    case .listLatestTransactionsRequested(accountId: let accountId, pagination: let pagination):
        state.latestTransactions = []
        state.hasMoreTransactions = false
        state.isLoadingLatestTransactions = true

        return Effect
            .task { await environment.transactionsService.listLatestTransactions(accountId: accountId, pagination: pagination) }
            .map { (transactions, hasMore) in
                if !transactions.isEmpty {
                    return .listLatestTransactionsSucceeded(transactions: transactions, hasMore: hasMore)
                }

                return .listLatestTransactionsFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .listLatestTransactionsSucceeded(transactions: let transactions, hasMore: let hasMore):
        state.latestTransactions = IdentifiedArray.init(uniqueElements: transactions, id: \.id)
        state.hasMoreTransactions = hasMore
        state.isLoadingLatestTransactions = false

        return .none
    case .listLatestTransactionsFailed:
        state.isLoadingLatestTransactions = false

        return .none
    case .loadMoreLatestTransactionsRequested(accountId: let accountId, pagination: let pagination):
        if state.isLoadingLatestTransactions || state.isLoadingMoreLatestTransactions || !state.hasMoreTransactions {
            return .none
        }

        if let cursor = pagination.cursor, state.latestTransactions.map(\.id).dropLast(6).last != cursor {
            return .none
        }

        state.isLoadingMoreLatestTransactions = true

        return Effect
            .task { await environment.transactionsService.listLatestTransactions(accountId: accountId, pagination: pagination) }
            .map { (transactions, hasMore) in
                if !transactions.isEmpty {
                    return .loadMoreLatestTransactionsSucceeded(transactions: transactions, hasMore: hasMore)
                }

                return .loadMoreLatestTransactionsFailed
            }
            .receive(on: environment.mainQueue)
            .eraseToEffect()
    case .loadMoreLatestTransactionsSucceeded(transactions: let transactions, hasMore: let hasMore):
        IdentifiedArray.init(uniqueElements: transactions, id: \.id).forEach { state.latestTransactions.append($0)}
        state.hasMoreTransactions = hasMore
        state.isLoadingMoreLatestTransactions = false

        return .none
    case .loadMoreLatestTransactionsFailed:
        state.isLoadingMoreLatestTransactions = false

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
