import SwiftUI
import ComposableArchitecture

struct AccountView: View {
    let store: Store<AccountsState, AccountsAction>
    let account: Account

    @State private var showNewTransactionSheet = false
    @State private var showDeleteAccountConfirmationDialog = false

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Button(role: .destructive) {
                    showDeleteAccountConfirmationDialog = true
                } label: {
                    Text("Delete account")
                }
                .confirmationDialog("You are about to delete your account", isPresented: $showDeleteAccountConfirmationDialog, titleVisibility: .visible) {
                    Button(role: .destructive) {
                        if account is BudgetAccount {
                            viewStore.send(.deleteBudgetAccountRequested(id: account.id))
                        }

                        if account is TrackingAccount {
                            viewStore.send(.deleteTrackingAccountRequested(id: account.id))
                        }
                    } label: {
                        Text("Delete")
                    }
                } message: {
                    Text("This action cannot be undone")
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
                    NewTransactionModalView(store: store)
                }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LazyVStack {
                AccountView(
                    store: Store(
                        initialState: AccountsState(),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountService(apolloClient: Network.shared.apollo)
                        )
                    ),
                    account: BudgetAccount(
                        id: "account-id",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    )
                )
            }
            .navigationBarHidden(false)
        }
    }
}
