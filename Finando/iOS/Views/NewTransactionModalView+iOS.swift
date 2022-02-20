import SwiftUI

struct NewTransactionModalView: View {
    let store: Store<AccountsState, AccountsAction>

    @Environment(\.dismiss) private var dismiss: DismissAction

    var body: some View {
        NavigationView {
            Text("HELLO")
                .navigationTitle("New transaction")
        }
    }
}

struct NewTransactionModalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                NewTransactionModalView(
                    store: Store(
                        initialState: AccountsState(
                            accounts: [
                                BudgetAccount(id: "demo-account-id-1", name: "Demo account 1"),
                                BudgetAccount(id: "demo-account-id-2", name: "Demo account 2"),
                                BudgetAccount(id: "demo-account-id-3", name: "Demo account 3"),
                                BudgetAccount(id: "demo-account-id-4", name: "Demo account 4"),
                                BudgetAccount(id: "demo-account-id-5", name: "Demo account 5")
                            ]
                        ),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountService(apolloClient: Network.shared.apollo)
                        )
                    )
                )
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            ZStack {
                NewTransactionModalView(
                    store: Store(
                        initialState: AccountsState(
                            accounts: [
                                BudgetAccount(id: "demo-account-id-1", name: "Demo account 1"),
                                BudgetAccount(id: "demo-account-id-2", name: "Demo account 2"),
                                BudgetAccount(id: "demo-account-id-3", name: "Demo account 3"),
                                BudgetAccount(id: "demo-account-id-4", name: "Demo account 4"),
                                BudgetAccount(id: "demo-account-id-5", name: "Demo account 5")
                            ]
                        ),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountService(apolloClient: Network.shared.apollo)
                        )
                    )
                )
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
    }
}
