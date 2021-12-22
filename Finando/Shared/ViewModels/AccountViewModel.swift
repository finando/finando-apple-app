import Foundation
import Combine

class AccountViewModel: ObservableObject {
    @Published var accountId: String?
    @Published private(set) var account: Account?

    private var cancellables = Set<AnyCancellable>()

    init() {
        $accountId
            .sink { [weak self] accountId in
                if let accountId = accountId {
                    self?.getAccount(accountId: accountId)
                }
            }
            .store(in: &cancellables)
    }

    public func setAccountId(_ accountId: String) {
        self.accountId = accountId
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
        if let budgetAccount = data?.fragments.getAccountAccountFragment.asBudgetAccount {
            return Account.BudgetAccount(BudgetAccount(fragment: budgetAccount))
        }

        if let trackingAccount = data?.fragments.getAccountAccountFragment.asTrackingAccount {
            return Account.TrackingAccount(TrackingAccount(fragment: trackingAccount))
        }
        
        return nil
    }
}
