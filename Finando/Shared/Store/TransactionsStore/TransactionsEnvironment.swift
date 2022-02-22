import CombineSchedulers

struct TransactionsEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var transactionsService: TransactionService
}
