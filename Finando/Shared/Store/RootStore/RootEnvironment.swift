import Apollo
import CombineSchedulers

struct RootEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var apolloClient: ApolloClient
}
