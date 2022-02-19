import Foundation

enum GraphQLResponseParser {
    static func parse(data: [ListAccountsAccountFragment]?) -> [Account] {
        return data?.compactMap({ fragment in
            if let budgetAccount = fragment.asBudgetAccount {
                return createAccount(accountFragment: budgetAccount)
            }

            if let trackingAccount = fragment.asTrackingAccount {
                return createAccount(accountFragment: trackingAccount)
            }

            return nil
        }) ?? []
    }

    static func parse(data: GetAccountAccountFragment?) -> Account? {
        if let budgetAccount = data?.asBudgetAccount {
            return createAccount(accountFragment: budgetAccount)
        }

        if let trackingAccount = data?.asTrackingAccount {
            return createAccount(accountFragment: trackingAccount)
        }

        return nil
    }

    static func parse<T: AccountFragment>(data: T?) -> Account? {
        return createAccount(accountFragment: data)
    }

    private static func createAccount<T: AccountFragment>(accountFragment: T?) -> Account? {
        switch accountFragment {
        case let fragment as GetAccountAccountFragment.AsBudgetAccount:
            return BudgetAccount(
                id: fragment.id,
                name: fragment.name ?? "",
                balance: parseBalance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
                balances: fragment.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map(parseBalance(fragment:))
            )
        case let fragment as GetAccountAccountFragment.AsTrackingAccount:
            return TrackingAccount(
                id: fragment.id,
                name: fragment.name ?? "",
                balance: parseBalance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
                balances: fragment.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map(parseBalance(fragment:))
            )
        case let fragment as ListAccountsAccountFragment.AsBudgetAccount:
            return BudgetAccount(
                id: fragment.id,
                name: fragment.name,
                balance: parseBalance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
            )
        case let fragment as ListAccountsAccountFragment.AsTrackingAccount:
            return TrackingAccount(
                id: fragment.id,
                name: fragment.name,
                balance: parseBalance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
            )
        case let fragment as CreateBudgetAccountBudgetAccountFragment:
            return BudgetAccount(
                id: fragment.id,
                name: fragment.name,
                balance: parseBalance(fragment: fragment.balance.fragments.createBudgetAccountBalanceFragment)
            )
        case let fragment as CreateTrackingAccountTrackingAccountFragment:
            return TrackingAccount(
                id: fragment.id,
                name: fragment.name,
                balance: parseBalance(fragment: fragment.balance.fragments.createTrackingAccountBalanceFragment)
            )
        case let fragment as DeleteBudgetAccountBudgetAccountFragment:
            return BudgetAccount(id: fragment.id)
        case let fragment as DeleteTrackingAccountTrackingAccountFragment:
            return TrackingAccount(id: fragment.id)
        default:
            return nil
        }
    }

    private static func parseBalance(fragment: BalanceFragment) -> Balance {
        Balance(
            date: ISO8601DateFormatter().date(from: fragment.date) ?? Date(),
            cleared: fragment.cleared,
            uncleared: fragment.uncleared,
            running: fragment.running,
            currency: fragment.currency
        )
    }
}
