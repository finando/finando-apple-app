import SwiftUI

struct NewExpenseTransactionFormView: View {
    let accounts: [Account]

    @State private var amount: Int = 0
    @State private var expenseAccount: Account? = nil
    @State private var receivingAccount: Account? = nil
    @State private var isExpenseToTrackedAccount = false
    @State private var description: String = ""
    @State private var transactionDateTime: Date = Date.now

    var body: some View {
        Form {
            Section {
                CurrencyInputFieldView(placeholder: "Amount", value: $amount)
            } header: {
                Text("Amount")
            } footer: {
                Text("Enter a curency amount")
            }

            Section {
                Picker(selection: $expenseAccount) {
                    ForEach(accounts) { account in
                        if account != receivingAccount {
                            Text(account.name ?? "")
                                .tag(account as Account?)
                        }
                    }
                } label: {
                    if expenseAccount != nil {
                        Text("Account")
                    } else {
                        Text("Select account...")
                    }
                }
            } header: {
                Text("Expense account")
            } footer: {
                Text("An account that will incur an expense")
            }

            Section {
                Toggle(isOn: $isExpenseToTrackedAccount) {
                    Text("Tracked expense")
                }
                .onChange(of: isExpenseToTrackedAccount) { value in
                    if value == false {
                        receivingAccount = nil
                    }
                }

                if isExpenseToTrackedAccount {
                    Picker(selection: $receivingAccount) {
                        ForEach(accounts) { account in
                            if account != expenseAccount {
                                Text(account.name ?? "")
                                    .tag(account as Account?)
                            }
                        }
                    } label: {
                        if receivingAccount != nil {
                            Text("Account")
                        } else {
                            Text("Select account...")
                        }
                    }
                }
            } header: {
                Text("Receiving account")
            } footer: {
                Text("Use tracked expense to specify an account that will receive a specified amount")
            }

            Section {
                TextInputFieldView(placeholder: "Description", value: $description)
            } header: {
                Text("Description")
            } footer: {
                Text("A short description of the expense")
            }

            // TODO: add input field for transaction tags

            Section {
                DatePicker("Time", selection: $transactionDateTime)
                    .datePickerStyle(.compact)
            } header: {
                Text("Transaction time")
            } footer: {
                Text("A date and time when the transaction took place")
            }
        }
    }
}

struct NewExpenseTransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                NewExpenseTransactionFormView(
                    accounts: [
                        BudgetAccount(id: "demo-account-id-1", name: "Demo account 1"),
                        BudgetAccount(id: "demo-account-id-2", name: "Demo account 2"),
                        BudgetAccount(id: "demo-account-id-3", name: "Demo account 3"),
                        BudgetAccount(id: "demo-account-id-4", name: "Demo account 4"),
                        BudgetAccount(id: "demo-account-id-5", name: "Demo account 5")
                    ]
                )
                    .navigationBarTitle("ASDASD")
                    .navigationBarHidden(true)
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            NavigationView {
                NewExpenseTransactionFormView(
                    accounts: [
                        BudgetAccount(id: "demo-account-id-1", name: "Demo account 1"),
                        BudgetAccount(id: "demo-account-id-2", name: "Demo account 2"),
                        BudgetAccount(id: "demo-account-id-3", name: "Demo account 3"),
                        BudgetAccount(id: "demo-account-id-4", name: "Demo account 4"),
                        BudgetAccount(id: "demo-account-id-5", name: "Demo account 5")
                    ]
                )
                    .navigationBarTitle("ASDASD")
                    .navigationBarHidden(true)
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
    }
}
