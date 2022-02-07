enum GraphQLResponseParser {
    static func parse(data: [ListAccountsQuery.Data.Account]?) -> [Account] {
        return data?.compactMap({ account in
            if let budgetAccount = account.fragments.listAccountsAccountFragment.asBudgetAccount {
                return .BudgetAccount(BudgetAccount(fragment: budgetAccount))
            }

            if let trackingAccount = account.fragments.listAccountsAccountFragment.asTrackingAccount {
                return .TrackingAccount(TrackingAccount(fragment: trackingAccount))
            }

            return nil
        }) ?? []
    }

    static func parse(data: GetAccountQuery.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.getAccountAccountFragment.asBudgetAccount {
            return .BudgetAccount(BudgetAccount(fragment: budgetAccount))
        }

        if let trackingAccount = data?.fragments.getAccountAccountFragment.asTrackingAccount {
            return .TrackingAccount(TrackingAccount(fragment: trackingAccount))
        }

        return nil
    }

    static func parse(data: CreateBudgetAccountMutation.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.createBudgetAccountBudgetAccountFragment {
            return .BudgetAccount(BudgetAccount(fragment: budgetAccount))
        }

        return nil
    }

    static func parse(data: CreateTrackingAccountMutation.Data.Account?) -> Account? {
        if let trackingAccount = data?.fragments.createTrackingAccountTrackingAccountFragment {
            return .TrackingAccount(TrackingAccount(fragment: trackingAccount))
        }

        return nil
    }

    static func parse(data: DeleteBudgetAccountMutation.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.deleteBudgetAccountBudgetAccountFragment {
            return .BudgetAccount(BudgetAccount(fragment: budgetAccount))
        }

        return nil
    }

    static func parse(data: DeleteTrackingAccountMutation.Data.Account?) -> Account? {
        if let trackingAccount = data?.fragments.deleteTrackingAccountTrackingAccountFragment {
            return .TrackingAccount(TrackingAccount(fragment: trackingAccount))
        }

        return nil
    }
}
