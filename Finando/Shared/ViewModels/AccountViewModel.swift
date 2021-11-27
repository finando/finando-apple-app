import Foundation
import Combine

class AccountViewModel: ObservableObject {
    @Published private(set) var account: Account?
    
    init(accountId: String) {
        getAccount(accountId: accountId)
    }

    private func getAccount(accountId: String) {
        Network
            .shared
            .apollo
            .fetch(query: constructGetAccountQuery(accountId: accountId)) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.account = self?.parse(data: response.data?.account)
                case .failure(let error):
                    print(error)
                }
            }
    }

    private func constructGetAccountQuery(accountId: String) -> GetAccountQuery {
        return GetAccountQuery(id: accountId, balanceToDate: Date().toISO8601Format())
    }

    private func parse(data: GetAccountQuery.Data.Account?) -> Account? {
        if let budgetAccount = data?.fragments.accountFragment.asBudgetAccount {
            return Account.BudgetAccount(BudgetAccount(fragment: budgetAccount))
        }
        
        if let trackingAccount = data?.fragments.accountFragment.asTrackingAccount {
            return Account.TrackingAccount(TrackingAccount(fragment: trackingAccount))
        }
        
        return nil
    }
}
