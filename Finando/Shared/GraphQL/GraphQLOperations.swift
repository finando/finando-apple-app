import Foundation

enum GraphQLOperations {
    enum Query {
        static func listAccounts() -> ListAccountsQuery {
            ListAccountsQuery(balanceToDate: Date().toISO8601Format())
        }

        static func getAccount(id: String) -> GetAccountQuery {
            GetAccountQuery(
                id: id,
                balanceToDate: Date().toISO8601Format(),
                balancesFromDate: "2021-11-01T00:00:00.000Z",
                balancesToDate: "2021-12-31T00:00:00.000Z",
                frequency: .daily
            )
        }

        static func listTransactions(accountId: String) -> ListTransactionsQuery {
            ListTransactionsQuery(accountId: accountId)
        }

        static func listScheduledTransactions(accountId: String) -> ListScheduledTransactionsQuery {
            ListScheduledTransactionsQuery(accountId: accountId)
        }
    }

    enum Mutation {
        static func createBudgetAccount(data: CreateBudgetAccountInput) -> CreateBudgetAccountMutation {
            CreateBudgetAccountMutation(
                data: data,
                balanceToDate: Date().toISO8601Format()
            )
        }

        static func createTrackingAccount(data: CreateTrackingAccountInput) -> CreateTrackingAccountMutation {
            CreateTrackingAccountMutation(
                data: data,
                balanceToDate: Date().toISO8601Format()
            )
        }

        static func deleteBudgetAccount(id: String) -> DeleteBudgetAccountMutation {
            DeleteBudgetAccountMutation(id: id)
        }

        static func deleteTrackingAccount(id: String) -> DeleteTrackingAccountMutation {
            DeleteTrackingAccountMutation(id: id)
        }
    }
}
