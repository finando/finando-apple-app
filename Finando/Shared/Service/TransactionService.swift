import Apollo

final class TransactionService {
    private let apolloClient: ApolloClient

    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    func listTransactions(accountId: String) async -> [Transaction] {
        typealias Continuation = CheckedContinuation<GraphQLResult<ListTransactionsQuery.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.fetch(
                    query: GraphQLOperations.Query.listTransactions(accountId: accountId),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.transactions.map(\.fragments.listTransactionsTransactionFragment))
        } catch {
            // TODO: handle errors
        }

        return []
    }

    func listScheduledTransactions(accountId: String) async -> [ScheduledTransaction] {
        typealias Continuation = CheckedContinuation<GraphQLResult<ListScheduledTransactionsQuery.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.fetch(
                    query: GraphQLOperations.Query.listScheduledTransactions(accountId: accountId),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.scheduledTransactions.map(\.fragments.listScheduledTransactionsScheduledTransactionFragment))
        } catch {
            // TODO: handle errors
        }

        return []
    }
}
