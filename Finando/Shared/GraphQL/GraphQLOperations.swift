import Foundation

enum GraphQLOperations {
    enum Query {
        static func listAccounts() -> ListAccountsQuery {
            ListAccountsQuery(balanceToDate: Date().toISO8601Format())
        }

        static func getAccount(id: Account.ID) -> GetAccountQuery {
            GetAccountQuery(
                id: id,
                balanceToDate: Date().toISO8601Format(),
                balancesFromDate: "2021-11-01T00:00:00.000Z",
                balancesToDate: "2021-12-31T00:00:00.000Z",
                frequency: .daily
            )
        }

        static func listTransactions(accountId: Account.ID) -> ListTransactionsQuery {
            ListTransactionsQuery(accountId: accountId)
        }

        static func listLatestTransactions(accountId: Account.ID, paginationInput: PaginationInput) -> ListLatestTransactionsQuery {
            ListLatestTransactionsQuery(
                accountId: accountId,
                paginationInput: paginationInput
            )
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

        static func deleteBudgetAccount(id: Account.ID) -> DeleteBudgetAccountMutation {
            DeleteBudgetAccountMutation(id: id)
        }

        static func deleteTrackingAccount(id: Account.ID) -> DeleteTrackingAccountMutation {
            DeleteTrackingAccountMutation(id: id)
        }

        static func createTransaction(data: CreateTransactionInput) -> CreateTransactionMutation {
            CreateTransactionMutation(data: data)
        }
    }
}
