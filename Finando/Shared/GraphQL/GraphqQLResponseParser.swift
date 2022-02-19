import Foundation

private protocol AccountFragment: Identifiable {}

private protocol Named {
    var name: String? { get }
}

private protocol BalanceFragment {
    var date: String { get }
    var cleared: Int { get }
    var uncleared: Int { get }
    var running: Int { get }
    var currency: String { get }
}

extension ListAccountsAccountFragment.AsBudgetAccount: AccountFragment, Named {}
extension ListAccountsAccountFragment.AsTrackingAccount: AccountFragment, Named {}
extension GetAccountAccountFragment.AsBudgetAccount: AccountFragment, Named {}
extension GetAccountAccountFragment.AsTrackingAccount: AccountFragment, Named {}
extension CreateBudgetAccountBudgetAccountFragment: AccountFragment, Named {}
extension CreateTrackingAccountTrackingAccountFragment: AccountFragment, Named {}
extension DeleteBudgetAccountBudgetAccountFragment: AccountFragment {}
extension DeleteTrackingAccountTrackingAccountFragment: AccountFragment {}

extension ListAccountsBalanceFragment: BalanceFragment {}
extension GetAccountBalanceFragment: BalanceFragment {}
extension CreateBudgetAccountBalanceFragment: BalanceFragment {}
extension CreateTrackingAccountBalanceFragment: BalanceFragment {}

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

    static func parse(data: CreateBudgetAccountBudgetAccountFragment?) -> Account? {
        return createAccount(accountFragment: data)
    }

    static func parse(data: CreateTrackingAccountTrackingAccountFragment?) -> Account? {
        return createAccount(accountFragment: data)
    }

    static func parse(data: DeleteBudgetAccountBudgetAccountFragment?) -> Account? {
        return createAccount(accountFragment: data)
    }

    static func parse(data: DeleteTrackingAccountTrackingAccountFragment?) -> Account? {
        return createAccount(accountFragment: data)
    }

    private static func createAccount<T: AccountFragment>(accountFragment: T?) -> Account? {
        switch accountFragment {
        case let fragment as GetAccountAccountFragment.AsBudgetAccount:
            return .BudgetAccount(.init(
                id: fragment.id,
                name: fragment.name ?? "",
                balance: createBalance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
                balances: fragment.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map(createBalance(fragment:))
            ))
        case let fragment as GetAccountAccountFragment.AsTrackingAccount:
            return .TrackingAccount(.init(
                id: fragment.id,
                name: fragment.name ?? "",
                balance: createBalance(fragment: fragment.balance.fragments.getAccountBalanceFragment),
                balances: fragment.balances
                    .map(\.fragments.getAccountBalanceFragment)
                    .map(createBalance(fragment:))
            ))
        case let fragment as ListAccountsAccountFragment.AsBudgetAccount:
            return .BudgetAccount(.init(
                id: fragment.id,
                name: fragment.name,
                balance: createBalance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
            ))
        case let fragment as ListAccountsAccountFragment.AsTrackingAccount:
            return .TrackingAccount(.init(
                id: fragment.id,
                name: fragment.name,
                balance: createBalance(fragment: fragment.balance.fragments.listAccountsBalanceFragment)
            ))
        case let fragment as CreateBudgetAccountBudgetAccountFragment:
            return .BudgetAccount(.init(
                id: fragment.id,
                name: fragment.name,
                balance: createBalance(fragment: fragment.balance.fragments.createBudgetAccountBalanceFragment)
            ))
        case let fragment as CreateTrackingAccountTrackingAccountFragment:
            return .TrackingAccount(.init(
                id: fragment.id,
                name: fragment.name,
                balance: createBalance(fragment: fragment.balance.fragments.createTrackingAccountBalanceFragment)
            ))
        case let fragment as DeleteBudgetAccountBudgetAccountFragment:
            return .BudgetAccount(.init(id: fragment.id))
        case let fragment as DeleteTrackingAccountTrackingAccountFragment:
            return .TrackingAccount(.init(id: fragment.id))
        default:
            return nil
        }
    }

    private static func createBalance(fragment: BalanceFragment) -> Balance {
        Balance(
            date: ISO8601DateFormatter().date(from: fragment.date) ?? Date(),
            cleared: fragment.cleared,
            uncleared: fragment.uncleared,
            running: fragment.running,
            currency: fragment.currency
        )
    }
}
