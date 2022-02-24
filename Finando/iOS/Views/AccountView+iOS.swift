import SwiftUI
import ComposableArchitecture

struct AccountView: View {
    let accountsStore: Store<AccountsState, AccountsAction>
    let transactionsStore: Store<TransactionsState, TransactionsAction>
    let account: Account

    @State private var showNewTransactionSheet = false
    @State private var showDeleteAccountConfirmationDialog = false

    var body: some View {
        WithViewStore(accountsStore) { accountsViewStore in
            WithViewStore(transactionsStore) { transactionsViewStore in
                ScrollView {
                    LazyVStack {
                        ForEach(transactionsViewStore.transactions) { transaction in
                            NavigationLinkTransactionItemView(account: account, transaction: transaction)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.vertical, 16)
                    .navigationTitle(account.name ?? "")
                    .navigationViewStyle(.columns)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button {
                                showNewTransactionSheet = true
                            } label: {
                                Label("New transaction", systemImage: "rectangle.stack.badge.plus")
                            }
                        }

                        ToolbarItem(placement: .destructiveAction) {
                            Button(role: .destructive) {
                                showDeleteAccountConfirmationDialog = true
                            } label: {
                                Label("Delete account", systemImage: "trash")
                                    .accentColor(Color.red)
                            }
                            .confirmationDialog("You are about to delete your account", isPresented: $showDeleteAccountConfirmationDialog, titleVisibility: .visible) {
                                Button(role: .destructive) {
                                    if account is BudgetAccount {
                                        accountsViewStore.send(.deleteBudgetAccountRequested(id: account.id))
                                    }

                                    if account is TrackingAccount {
                                        accountsViewStore.send(.deleteTrackingAccountRequested(id: account.id))
                                    }
                                } label: {
                                    Text("Delete")
                                }
                            } message: {
                                Text("This action cannot be undone")
                            }
                        }
                    }
                    .sheet(isPresented: $showNewTransactionSheet) {
                        NewTransactionModalView(store: accountsStore)
                    }
                    .onAppear {
                        transactionsViewStore.send(.listTransactionsRequested(accountId: account.id))
                        transactionsViewStore.send(.listScheduledTransactionsRequested(accountId: account.id))
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LazyVStack {
                AccountView(
                    accountsStore: Store(
                        initialState: AccountsState(),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountService(apolloClient: Network.shared.apollo)
                        )
                    ),
                    transactionsStore: Store(
                        initialState: TransactionsState(),
                        reducer: transactionsReducer,
                        environment: TransactionsEnvironment(
                            mainQueue: .main,
                            transactionsService: TransactionService(apolloClient: Network.shared.apollo)
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
