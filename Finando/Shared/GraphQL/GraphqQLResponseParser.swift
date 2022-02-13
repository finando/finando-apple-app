import Foundation

enum GraphQLResponseParser {
    static func parse(data: [ListAccountsQuery.Data.Account]?) -> [Account] {
        return data?.compactMap({ account in
            if let budgetAccount = account.fragments.listAccountsAccountFragment.asBudgetAccount {
                let balanceFragment = budgetAccount.balance.fragments.listAccountsBalanceFragment

                return .BudgetAccount(BudgetAccount(
                    id: budgetAccount.id,
                    name: budgetAccount.name ?? "",
                    balance: Balance(
                        date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                        cleared: balanceFragment.cleared,
                        uncleared: balanceFragment.uncleared,
                        running: balanceFragment.running,
                        currency: balanceFragment.currency
                    )
                ))
            }

            if let trackingAccount = account.fragments.listAccountsAccountFragment.asTrackingAccount {
                let balanceFragment = trackingAccount.balance.fragments.listAccountsBalanceFragment

                return .TrackingAccount(TrackingAccount(
                    id: trackingAccount.id,
                    name: trackingAccount.name ?? "",
                    balance: Balance(
                        date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                        cleared: balanceFragment.cleared,
                        uncleared: balanceFragment.uncleared,
                        running: balanceFragment.running,
                        currency: balanceFragment.currency
                    )
                ))
            }

            return nil
        }) ?? []
    }

    static func parse(data: GetAccountQuery.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.getAccountAccountFragment.asBudgetAccount {
            let balanceFragment = budgetAccount.balance.fragments.getAccountBalanceFragment

            return .BudgetAccount(BudgetAccount(
                id: budgetAccount.id,
                name: budgetAccount.name ?? "",
                balance: Balance(
                    date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                    cleared: balanceFragment.cleared,
                    uncleared: balanceFragment.uncleared,
                    running: balanceFragment.running,
                    currency: balanceFragment.currency
                ),
                balances: budgetAccount.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map({
                        Balance(
                            date: ISO8601DateFormatter().date(from: $0.date) ?? Date(),
                            cleared: $0.cleared,
                            uncleared: $0.uncleared,
                            running: $0.running,
                            currency: $0.currency
                        )
                    })
            ))
        }

        if let trackingAccount = data?.fragments.getAccountAccountFragment.asTrackingAccount {
            let balanceFragment = trackingAccount.balance.fragments.getAccountBalanceFragment

            return .TrackingAccount(TrackingAccount(
                id: trackingAccount.id,
                name: trackingAccount.name ?? "",
                balance: Balance(
                    date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                    cleared: balanceFragment.cleared,
                    uncleared: balanceFragment.uncleared,
                    running: balanceFragment.running,
                    currency: balanceFragment.currency
                ),
                balances: trackingAccount.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map({
                        Balance(
                            date: ISO8601DateFormatter().date(from: $0.date) ?? Date(),
                            cleared: $0.cleared,
                            uncleared: $0.uncleared,
                            running: $0.running,
                            currency: $0.currency
                        )
                    })
            ))
        }

        return nil
    }

    static func parse(data: CreateBudgetAccountMutation.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.createBudgetAccountBudgetAccountFragment {
            let balanceFragment = budgetAccount.balance.fragments.createBudgetAccountBalanceFragment

            return .BudgetAccount(BudgetAccount(
                id: budgetAccount.id,
                name: budgetAccount.name ?? "",
                balance: Balance(
                    date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                    cleared: balanceFragment.cleared,
                    uncleared: balanceFragment.uncleared,
                    running: balanceFragment.running,
                    currency: balanceFragment.currency
                )
            ))
        }

        return nil
    }

    static func parse(data: CreateTrackingAccountMutation.Data.Account?) -> Account? {
        if let trackingAccount = data?.fragments.createTrackingAccountTrackingAccountFragment {
            let balanceFragment = trackingAccount.balance.fragments.createTrackingAccountBalanceFragment

            return .TrackingAccount(TrackingAccount(
                id: trackingAccount.id,
                name: trackingAccount.name ?? "",
                balance: Balance(
                    date: ISO8601DateFormatter().date(from: balanceFragment.date) ?? Date(),
                    cleared: balanceFragment.cleared,
                    uncleared: balanceFragment.uncleared,
                    running: balanceFragment.running,
                    currency: balanceFragment.currency
                )
            ))
        }

        return nil
    }

    static func parse(data: DeleteBudgetAccountMutation.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.deleteBudgetAccountBudgetAccountFragment {
            return .BudgetAccount(BudgetAccount(id: budgetAccount.id))
        }

        return nil
    }

    static func parse(data: DeleteTrackingAccountMutation.Data.Account?) -> Account? {
        if let trackingAccount = data?.fragments.deleteTrackingAccountTrackingAccountFragment {
            return .TrackingAccount(TrackingAccount(id: trackingAccount.id))
        }

        return nil
    }
}
