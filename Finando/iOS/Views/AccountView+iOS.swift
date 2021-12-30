import SwiftUI
import ComposableArchitecture

struct AccountView: View {
    let store: Store<AccountsState, AccountsAction>
    let account: Account

    @State private var showNewTransactionSheet = false

    var body: some View {
        WithViewStore(store) { viewStore in
            Group {
                Text(account.name ?? "")

                Button {
                    if account.isBudgetAccount {
                        viewStore.send(.deleteBudgetAccountRequested(id: account.id))
                    }

                    if account.isTrackingAccount {
                        viewStore.send(.deleteTrackingAccountRequested(id: account.id))
                    }
                } label: {
                    Text("Delete account")
                }
            }
                .navigationTitle(account.name ?? "")
                .navigationViewStyle(.columns)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Menu {
                            Button {
                                showNewTransactionSheet = true
                            } label: {
                                Label("New transaction", systemImage: "rectangle.stack.badge.plus")
                            }

                        } label: {
                            Image(systemName: "plus.square")
                        }
                    }
                }
                .sheet(isPresented: $showNewTransactionSheet) {
                    NewTransactionModalView()
                }
        }
    }
}

struct NewTransactionModalView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Text("HELLO")
                .navigationTitle("New transaction")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(
            store: Store(
                initialState: AccountsState(),
                reducer: accountsReducer,
                environment: AccountsEnvironment(
                    mainQueue: .main,
                    accountService: AccountService(apolloClient: Network.shared.apollo)
                )
            ),
            account: Account.BudgetAccount(
                .init(
                    id: "account-id",
                    name: "Account name",
                    balance: Balance(
                        currency: "NOK"
                    )
                )
            )
        )
    }
}
