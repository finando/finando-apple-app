import SwiftUI
import ComposableArchitecture

struct NewTransactionModalView: View {
    let accountsStore: Store<AccountsState, AccountsAction>

    @Environment(\.dismiss) private var dismiss: DismissAction

    @State private var transactionType = TransactionType.expense

    var body: some View {
        WithViewStore(accountsStore) { accountsViewStore in
            NavigationView {
                VStack(spacing: 16) {
                    Picker("Transaction type", selection: $transactionType) {
                        ForEach(TransactionType.allCases, id: \.self) { transactionType in
                            Text(transactionType.translation)
                                .tag(transactionType)
                        }
                    }
                    .pickerStyle(.segmented)
                    .headerProminence(.increased)
                    .padding(.horizontal, 16)

                    TabView(selection: $transactionType) {
                        NewIncomeTransactionFormView()
                            .tag(TransactionType.income)

                        NewExpenseTransactionFormView(accounts: accountsViewStore.accounts)
                            .tag(TransactionType.expense)

                        NewTransferTransactionFormView()
                            .tag(TransactionType.transfer)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                    Button {
                        print("SUBMIT")
                    } label: {
                        Label("Create transaction", systemImage: "paperplane.fill")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.vertical, 16)
                .navigationTitle("New transaction")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }

                    }
                }

            }
        }
    }
}

struct NewTransactionModalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewTransactionModalView(
                accountsStore: Store(
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
                .preferredColorScheme(.light)
                .previewDisplayName("Light mode")

            NewTransactionModalView(
                accountsStore: Store(
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
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark mode")
        }
    }
}
