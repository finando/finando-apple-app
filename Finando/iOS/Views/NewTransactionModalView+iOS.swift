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
                                BudgetAccount(id: "receiving-account-id-1", name: "Receiving account 1"),
                                BudgetAccount(id: "receiving-account-id-2", name: "Receiving account 2"),
                                BudgetAccount(id: "receiving-account-id-3", name: "Receiving account 3"),
                                BudgetAccount(id: "receiving-account-id-4", name: "Receiving account 4"),
                                BudgetAccount(id: "receiving-account-id-5", name: "Receiving account 5")
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
                                BudgetAccount(id: "receiving-account-id-1", name: "Receiving account 1"),
                                BudgetAccount(id: "receiving-account-id-2", name: "Receiving account 2"),
                                BudgetAccount(id: "receiving-account-id-3", name: "Receiving account 3"),
                                BudgetAccount(id: "receiving-account-id-4", name: "Receiving account 4"),
                                BudgetAccount(id: "receiving-account-id-5", name: "Receiving account 5")
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
