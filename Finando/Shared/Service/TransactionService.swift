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

    func listLatestTransactions(accountId: String, pagination: Pagination) async -> ([Transaction], Bool) {
        typealias Continuation = CheckedContinuation<GraphQLResult<ListLatestTransactionsQuery.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.fetch(
                    query: GraphQLOperations.Query.listLatestTransactions(
                        accountId: accountId,
                        paginationInput: PaginationInput(
                            cursor: pagination.cursor,
                            take: pagination.take
                        )
                    ),
                    resultHandler: continuation.resume(with:)
                )
            }

            let transactions = GraphQLResponseParser.parse(data: result.data?.transactions.data.map(\.fragments.listLatestTransactionsTransactionFragment))
            let hasMore = result.data?.transactions.hasMore ?? false

            return (transactions, hasMore)
        } catch {
            // TODO: handle errors
        }

        return ([], false)
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
