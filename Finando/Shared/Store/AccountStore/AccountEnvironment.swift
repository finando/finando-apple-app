import CombineSchedulers

struct AccountEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var accountService: AccountServiceProtocol
}
