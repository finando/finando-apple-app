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
                    LazyVStack(alignment: .leading, spacing: 8) {
                        ForEach(transactionsViewStore.latestTransactions) { transaction in
                            NavigationLinkTransactionItemView(account: account, transaction: transaction)
                                .padding(.horizontal, 16)
                                .onAppear {
                                    transactionsViewStore.send(.loadMoreLatestTransactionsRequested(accountId: account.id, pagination: Pagination(cursor: transaction.id, take: 18)))
                                }
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
                        transactionsViewStore.send(.listLatestTransactionsRequested(accountId: account.id, pagination: Pagination(take: 18)))
                        transactionsViewStore.send(.listScheduledTransactionsRequested(accountId: account.id))
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var account: Account = BudgetAccount(
        id: "account-id-1",
        name: "Account name",
        balance: Balance(
            currency: "NOK"
        )
    )
    static var transactions: [Transaction] {
        get {
            let transactionTypes: [TransactionType] = [.income, .expense, .transfer]

            return (0...15).map { id in
                let transactionType = transactionTypes.randomElement()!

                switch transactionType {
                case .income:
                    return Transaction(
                        id: "transaction-id-\(id)",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: account.id,
                                debit: 12345,
                                credit: 0,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Income transaction description",
                        tags: [.income],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                case .expense:
                    return Transaction(
                        id: "transaction-id-\(id)",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: account.id,
                                debit: 0,
                                credit: 12345,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Expense transaction description",
                        tags: [.expense],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                case .transfer:
                    return Transaction(
                        id: "transaction-id-\(id)",
                        entries: [],
                        status: .uncleared,
                        description: "Transfer transaction description",
                        tags: [.transfer],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                }
            }
        }
    }

    static var previews: some View {
        Group {
            NavigationView {
                AccountView(
                    accountsStore: Store(
                        initialState: AccountsState(),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountServiceMock()
                        )
                    ),
                    transactionsStore: Store(
                        initialState: TransactionsState(),
                        reducer: transactionsReducer,
                        environment: TransactionsEnvironment(
                            mainQueue: .main,
                            transactionsService: TransactionServiceMock(
                                transactions: transactions
                            )
                        )
                    ),
                    account: account
                )
                    .navigationBarHidden(false)
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            NavigationView {
                AccountView(
                    accountsStore: Store(
                        initialState: AccountsState(),
                        reducer: accountsReducer,
                        environment: AccountsEnvironment(
                            mainQueue: .main,
                            accountService: AccountServiceMock()
                        )
                    ),
                    transactionsStore: Store(
                        initialState: TransactionsState(),
                        reducer: transactionsReducer,
                        environment: TransactionsEnvironment(
                            mainQueue: .main,
                            transactionsService: TransactionServiceMock(
                                transactions: transactions
                            )
                        )
                    ),
                    account: account
                )
                    .navigationBarHidden(false)
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
    }
}
