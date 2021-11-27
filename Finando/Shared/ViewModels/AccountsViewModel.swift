import Foundation
import Combine

class AccountsViewModel: ObservableObject {
    @Published private(set) var accounts = [Account]()
    
    init() {
        listAccounts()
    }
    
    private func listAccounts() {
        Network
            .shared
            .apollo
            .fetch(query: constructListAccountsQuery()) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.accounts = self?.parse(data: response.data?.accounts) ?? []
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private func constructListAccountsQuery() -> ListAccountsQuery {
        return ListAccountsQuery(balanceToDate: Date().toISO8601Format())
    }
    
    private func parse(data: [ListAccountsQuery.Data.Account]?) -> [Account] {
        return data?.compactMap({ account in
            if let budgetAccount = account.fragments.accountFragment.asBudgetAccount {
                return Account.BudgetAccount(BudgetAccount(fragment: budgetAccount))
            }
            
            if let trackingAccount = account.fragments.accountFragment.asTrackingAccount {
                return Account.TrackingAccount(TrackingAccount(fragment: trackingAccount))
            }
            
            return nil
        }) ?? []
    }
}
