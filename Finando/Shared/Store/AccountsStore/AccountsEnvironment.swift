import CombineSchedulers

struct AccountsEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var accountService: AccountServiceProtocol
}
