import SwiftUI
import ComposableArchitecture

struct AccountsView: View {
    let accountsStore: Store<AccountsState, AccountsAction>
    let transactionsStore: Store<TransactionsState, TransactionsAction>

    @Environment(\.editMode) private var editMode

    @State private var showNewAccountSheet = false
    
    var body: some View {
        WithViewStore(accountsStore) { accountsViewStore in
            WithViewStore(transactionsStore) { transactionsViewStore in
                NavigationView {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(accountsViewStore.accounts) { account in
                                NavigationLink(destination: AccountView(accountsStore: accountsStore, transactionsStore: transactionsStore, account: account)) {
                                    NavigationLinkAccountItemView(account: account)
                                        .padding(.horizontal, 16)
                                }
                                .buttonStyle(FlatLinkStyle())
                                .id(account.revision)
                            }
                            .onDelete { index in
                                print("DELETE ACCOUNT")
                            }
                        }
                        .padding(.vertical, 16)
                        .highPriorityGesture(DragGesture(minimumDistance: 25, coordinateSpace: .local)
                                                .onEnded { value in
                            print("DRAG: \(value)")
    //                        if abs(value.translation.height) < abs(value.translation.width) {
    //                            if abs(value.translation.width) > 50.0 {
    //                                if value.translation.width < 0 {
    //                                    self.swipeRightToLeft()
    //                                } else if value.translation.width > 0 {
    //                                    self.swipeLeftToRight()
    //                                }
    //                            }
    //                        }
                        }
                        )
                    }
                    .navigationTitle(editMode?.wrappedValue == .active ? "Edit accounts" : "Accounts")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Menu {
                                Button {
                                    showNewAccountSheet = true
                                } label: {
                                    Label("New account", systemImage: "rectangle.stack.badge.plus")
                                }

                                Button {
                                    editMode?.wrappedValue = .active
                                } label: {
                                    Label("Edit", systemImage: "rectangle.stack.badge.plus")
                                }
                            } label: {
                                Image(systemName: "plus.square")
                            }
                        }
                    }
                    .sheet(isPresented: $showNewAccountSheet) {
                        NewAccountModalView(store: accountsStore)
                    }
                }
                .onAppear {
                    accountsViewStore.send(.listAccountsRequested)
                }
            }
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var accounts: [Account] {
        get {
            let accountTypes: [Account] = [BudgetAccount(id: "budget"), TrackingAccount(id: "tracking")]

            return (0...15).compactMap { id in
                let accountType = accountTypes.randomElement()!

                switch accountType {
                case is BudgetAccount:
                    return BudgetAccount(
                        id: "account-id-\(id)",
                        name: "Budget account \(id)",
                        balance: Balance(
                            currency: "NOK"
                        )
                    )
                case is TrackingAccount:
                    return TrackingAccount(
                        id: "account-id-\(id)",
                        name: "Tracking account \(id)",
                        balance: Balance(
                            currency: "NOK"
                        )
                    )
                default:
                    return nil
                }
            }
        }
    }

    static var previews: some View {
        Group {
            AccountsView(
                accountsStore: Store(
                    initialState: AccountsState(),
                    reducer: accountsReducer,
                    environment: AccountsEnvironment(
                        mainQueue: .main,
                        accountService: AccountServiceMock(accounts: accounts)
                    )
                ),
                transactionsStore: Store(
                    initialState: TransactionsState(),
                    reducer: transactionsReducer,
                    environment: TransactionsEnvironment(
                        mainQueue: .main,
                        transactionsService: TransactionServiceMock()
                    )
                )
            )
                .preferredColorScheme(.light)
                .previewDisplayName("Light mode")

            AccountsView(
                accountsStore: Store(
                    initialState: AccountsState(),
                    reducer: accountsReducer,
                    environment: AccountsEnvironment(
                        mainQueue: .main,
                        accountService: AccountServiceMock(accounts: accounts)
                    )
                ),
                transactionsStore: Store(
                    initialState: TransactionsState(),
                    reducer: transactionsReducer,
                    environment: TransactionsEnvironment(
                        mainQueue: .main,
                        transactionsService: TransactionServiceMock()
                    )
                )
            )
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark mode")
        }
    }
}
