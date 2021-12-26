import Foundation

enum GraphQLOperations {
    static func listAccounts() -> ListAccountsQuery {
        ListAccountsQuery(balanceToDate: Date().toISO8601Format())
    }

    static func getAccount(accountId: String) -> GetAccountQuery {
        GetAccountQuery(
            id: accountId,
            balanceToDate: Date().toISO8601Format(),
            balancesFromDate: "2021-11-01T00:00:00.000Z",
            balancesToDate: "2021-12-31T00:00:00.000Z",
            frequency: .daily
        )
    }
}
