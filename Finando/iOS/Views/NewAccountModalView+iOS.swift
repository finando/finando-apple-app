import SwiftUI
import ComposableArchitecture

struct NewAccountModalView: View {
    let store: Store<AccountsState, AccountsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                Button(action: {
                    viewStore.send(
                        .createBudgetAccountRequested(
                            data: CreateBudgetAccountInput(
                                initialBalance: 0,
                                name: "Demo account",
                                type: .checking
                            )
                        )
                    )
                }, label: {
                    Text("Create account")
                })
                    .navigationTitle("New account")
            }
        }
    }
}

struct NewAccountModalView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountModalView(
            store: Store(
                initialState: AccountsState(),
                reducer: accountsReducer,
                environment: AccountsEnvironment(
                    mainQueue: .main,
                    accountService: AccountService(apolloClient: Network.shared.apollo)
                )
            )
        )
    }
}
