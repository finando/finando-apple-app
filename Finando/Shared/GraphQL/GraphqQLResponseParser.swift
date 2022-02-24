import Foundation

enum GraphQLResponseParser {
    static func parse(data: [ListAccountsAccountFragment]?) -> [Account] {
        return data?.compactMap({ fragment in
            if let budgetAccount = fragment.asBudgetAccount {
                return parseAccount(fragment: budgetAccount)
            }

            if let trackingAccount = fragment.asTrackingAccount {
                return parseAccount(fragment: trackingAccount)
            }

            return nil
        }) ?? []
    }

    static func parse(data: GetAccountAccountFragment?) -> Account? {
        if let budgetAccount = data?.asBudgetAccount {
            return parseAccount(fragment: budgetAccount)
        }

        if let trackingAccount = data?.asTrackingAccount {
            return parseAccount(fragment: trackingAccount)
        }

        return nil
    }

    static func parse<T: AccountFragment>(data: T?) -> Account? {
        return parseAccount(fragment: data)
    }

    static func parse<T: TransactionFragment>(data: [T]?) -> [Transaction] {
        return data?.compactMap(parseTransaction(fragment:)) ?? []
    }

    static func parse<T: ScheduledTransactionFragment>(data: [T]?) -> [ScheduledTransaction] {
        return data?.compactMap(parseScheduledTransaction(fragment:)) ?? []
    }

    private static func parseAccount<T: AccountFragment>(fragment: T?) -> Account? {
        switch fragment {
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

    private static func parseTransaction(fragment: TransactionFragment) -> Transaction? {
        switch fragment {
        case let fragment as ListTransactionsTransactionFragment:
            return Transaction(
                id: fragment.id,
                entries: fragment.entries.map(parseEntry(fragment:)),
                status: fragment.status,
                description: fragment.description ?? "",
                tags: fragment.tags,
                createdAt: parseDate(date: fragment.createdAt),
                updatedAt: parseDate(date: fragment.updatedAt)
            )
        default:
            return nil
        }
    }

    private static func parseScheduledTransaction(fragment: ScheduledTransactionFragment) -> ScheduledTransaction? {
        switch fragment {
        case let fragment as ListScheduledTransactionsScheduledTransactionFragment:
            return ScheduledTransaction(
                id: fragment.id,
                entries: fragment.entries.map(parseEntry(fragment:)),
                status: fragment.status,
                frequency: fragment.frequency,
                description: fragment.description ?? "",
                tags: fragment.tags,
                createdAt: parseDate(date: fragment.createdAt),
                updatedAt: parseDate(date: fragment.updatedAt)
            )
        default:
            return nil
        }
    }

    private static func parseEntry(fragment: EntryFragment) -> Entry {
        Entry(
            id: fragment.id,
            account: fragment.account,
            debit: Int(fragment.debit) ?? 0,
            credit: Int(fragment.credit) ?? 0,
            currency: fragment.currency
        )
    }

    private static func parseDate(date: String) -> Date? {
        let formatter = ISO8601DateFormatter()

        formatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withFractionalSeconds
        ]

        return formatter.date(from: date)
    }
}
