import SwiftUI

struct NavigationLinkTransactionItemView: View {
    let account: Account
    let transaction: Transaction

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(colorScheme == .dark ? .black : .theme.neutral.n0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(colorScheme == .dark ? Color.theme.neutral.n60.opacity(0.7) : Color.theme.neutral.n20.opacity(0.7), lineWidth: 2)
                        .foregroundColor(.clear)
                )
                .cornerRadius(10)
                .shadow(
                    color: colorScheme == .dark ? .theme.neutral.n60.opacity(0.3) : .theme.neutral.n20.opacity(0.4),
                    radius: 5,
                    x: 5,
                    y: 5
                )

            HStack(alignment: .center, spacing: 5) {
                Image(systemName: transactionType.icon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 15)
                    .foregroundColor(transactionTypeIconColour)

                VStack(alignment: .leading, spacing: 0) {
                    Text(transaction.description)
                        .foregroundColor(colorScheme == .dark ? .theme.neutral.n0 : .theme.neutral.n60)
                        .font(.system(size: 12, weight: .bold))

                    Text(transactionType.translation)
                        .foregroundColor(colorScheme == .dark ? .theme.neutral.n30 : .theme.neutral.n40)
                        .font(.system(size: 11, weight: .regular))
                }
                .padding(.horizontal, 5)

                Spacer()

                VStack(alignment: .trailing, spacing: 0) {
                    Text(formattedAmount)
                        .foregroundColor(transactionAmountColour)
                        .font(.system(size: 11, weight: .bold))

                    Text(transaction.createdAt?.formatted(format: "dd-MM-yyyy") ?? "")
                        .foregroundColor(colorScheme == .dark ? .theme.neutral.n30 : .theme.neutral.n40)
                        .font(.system(size: 11, weight: .regular))
                }
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        }
    }

    private var transactionType: TransactionType {
        let entry = transaction.entries.first { $0.account == account.id }

        if let debit = entry?.debit, debit > 0 {
            return .income
        }

        if let credit = entry?.credit, credit > 0 {
            return .expense
        }

        return .transfer
    }

    private var transactionTypeIconColour: Color {
        switch transactionType {
        case .income:
            return .theme.green.g60
        case .expense:
            return .theme.red.r60
        case .transfer:
            return .theme.yellow.y70
        }
    }

    private var formattedAmount: String {
        let entry = transaction.entries.first { $0.account == account.id }
        let currency = ""

        if let debit = entry?.debit, debit > 0 {
            return CurrencyUtils.formatAsCurrency(value: Double(debit) / 100, currency: currency)
        }

        if let credit = entry?.credit, credit > 0 {
            return CurrencyUtils.formatAsCurrency(value: Double(-credit) / 100, currency: currency)
        }

        return CurrencyUtils.formatAsCurrency(value: 0, currency: currency)
    }

    private var transactionAmountColour: Color {
        switch transactionType {
        case .income:
            return .theme.green.g60
        case .expense:
            return .theme.red.r60
        case .transfer:
            return .theme.yellow.y70
        }
    }
}

struct NavigationLinkTransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyVStack(spacing: 8) {
                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-1",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: "account-id-1",
                                debit: 12345,
                                credit: 0,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Income transaction",
                        tags: [.income],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-2",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: "account-id-1",
                                debit: 0,
                                credit: 12345,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Expense transaction",
                        tags: [.expense],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-3",
                        entries: [],
                        status: .uncleared,
                        description: "Transfer transaction",
                        tags: [.transfer],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )
            }
            .padding()
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            LazyVStack(spacing: 8) {
                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-1",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: "account-id-1",
                                debit: 12345,
                                credit: 0,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Income transaction",
                        tags: [.income],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-2",
                        entries: [
                            Entry(
                                id: "entry-id-1",
                                account: "account-id-1",
                                debit: 0,
                                credit: 12345,
                                currency: "NOK"
                            )
                        ],
                        status: .uncleared,
                        description: "Expense transaction",
                        tags: [.expense],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    account: BudgetAccount(
                        id: "account-id-1",
                        name: "Account name",
                        balance: Balance(
                            currency: "NOK"
                        )
                    ),
                    transaction: Transaction(
                        id: "transaction-id-3",
                        entries: [],
                        status: .uncleared,
                        description: "Transfer transaction",
                        tags: [.transfer],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )
            }
            .padding()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
        .previewLayout(.sizeThatFits)
    }
}
