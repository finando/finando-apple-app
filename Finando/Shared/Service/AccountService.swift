import Foundation
import Apollo

class AccountService {
    private let apolloClient: ApolloClient

    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    func listAccounts() async -> [Account] {
        typealias Continuation = CheckedContinuation<GraphQLResult<ListAccountsQuery.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.fetch(
                    query: GraphQLOperations.Query.listAccounts(),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.accounts)
        } catch {
            // TODO: handle errors
        }

        return []
    }

    func getAccount(id: String) async -> Account? {
        typealias Continuation = CheckedContinuation<GraphQLResult<GetAccountQuery.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.fetch(
                    query: GraphQLOperations.Query.getAccount(accountId: id),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.account)
        } catch {
            // TODO: handle errors
        }

        return nil
    }

    func createBudgetAccount(data: CreateBudgetAccountInput) async -> Account? {
        typealias Continuation = CheckedContinuation<GraphQLResult<CreateBudgetAccountMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.createBudgetAccount(data: data),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.account)
        } catch {
            // TODO: handle errors
        }

        return nil
    }

    func createTrackingAccount(data: CreateTrackingAccountInput) async -> Account? {
        typealias Continuation = CheckedContinuation<GraphQLResult<CreateTrackingAccountMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.createTrackingAccount(data: data),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.account)
        } catch {
            // TODO: handle errors
        }

        return nil
    }

    func deleteBudgetAccount(id: String) async -> Account? {
        typealias Continuation = CheckedContinuation<GraphQLResult<DeleteBudgetAccountMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.deleteBudgetAccount(id: id),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.account)
        } catch {
            // TODO: handle errors
        }

        return nil
    }

    func deleteTrackingAccount(id: String) async -> Account? {
        typealias Continuation = CheckedContinuation<GraphQLResult<DeleteTrackingAccountMutation.Data>, Error>

        do {
            let result = try await withCheckedThrowingContinuation { (continuation: Continuation) in
                apolloClient.perform(
                    mutation: GraphQLOperations.Mutation.deleteTrackingAccount(id: id),
                    resultHandler: continuation.resume(with:)
                )
            }

            return GraphQLResponseParser.parse(data: result.data?.account)
        } catch {
            // TODO: handle errors
        }

        return nil
    }
}
