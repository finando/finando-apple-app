import Apollo

final class TransactionService: TransactionServiceProtocol {
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

    func createTransaction(data: CreateTransactionInput) async -> Transaction? {
        typealias Continuation = CheckedContinuation<GraphQLResult<CreateTransactionMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.createTransaction(data: data),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.transaction.fragments.createTransactionTransactionFragment)
        } catch {
            // TODO: handle errors
        }

        return nil
    }

    func deleteTransaction(id: Transaction.ID) async -> Transaction? {
        typealias Continuation = CheckedContinuation<GraphQLResult<DeleteTransactionMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.deleteTransaction(id: id),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.transaction?.fragments.deleteTransactionTransactionFragment)
        } catch {
            // TODO: handle errors
        }

        return nil
    }
}
