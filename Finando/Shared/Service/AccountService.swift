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
                    query: GraphQLOperations.listAccounts(),
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
                    query: GraphQLOperations.getAccount(accountId: id),
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
