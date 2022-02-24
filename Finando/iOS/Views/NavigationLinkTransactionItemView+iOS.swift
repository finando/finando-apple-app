import SwiftUI

struct NavigationLinkTransactionItemView: View {
    let transaction: Transaction

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(colorScheme == ColorScheme.dark ? .black : Color.theme.neutral.n0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(colorScheme == ColorScheme.dark ? Color.theme.neutral.n60.opacity(0.7) : Color.theme.neutral.n20.opacity(0.7), lineWidth: 2)
                        .foregroundColor(.clear)
                )
                .cornerRadius(10)
                .shadow(
                    color: colorScheme == ColorScheme.dark ? Color.theme.neutral.n60.opacity(0.3) : Color.theme.neutral.n20.opacity(0.4),
                    radius: 5,
                    x: 5,
                    y: 5
                )

            HStack(alignment: .center, spacing: 5) {
                Image(systemName: transaction.type.icon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 15)
                    .foregroundColor(determineTransactionTypeIconColour(transaction.type))

                VStack(alignment: .leading, spacing: 0) {
                    Text(transaction.description)
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n0 : Color.theme.neutral.n60)
                        .font(.system(size: 12, weight: .bold))

                    Text(transaction.type.translation)
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n30 : Color.theme.neutral.n40)
                        .font(.system(size: 11, weight: .regular))
                }
                .padding(.horizontal, 5)

                Spacer()

                VStack(alignment: .trailing, spacing: 0) {
//                    Text(account.balance?.runningFormatted ?? "")
                    Text("Some")
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n0 : Color.theme.neutral.n60)
                        .font(.system(size: 11, weight: .bold))

                    Text("Running balance")
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n30 : Color.theme.neutral.n40)
                        .font(.system(size: 11, weight: .regular))
                }

                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(0.4, contentMode: .fit)
                    .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n20 : Color.theme.neutral.n40)
                    .frame(maxWidth: 6)
                    .padding(.leading, 8)
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        }
    }

    private func determineTransactionTypeIconColour(_ type: TransactionType) -> Color {
        switch type {
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
                    transaction: Transaction(
                        id: "transaction-id-1",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
                        tags: [.income],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    transaction: Transaction(
                        id: "transaction-id-2",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
                        tags: [.expense],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    transaction: Transaction(
                        id: "transaction-id-3",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
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
                    transaction: Transaction(
                        id: "transaction-id-1",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
                        tags: [.income],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    transaction: Transaction(
                        id: "transaction-id-2",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
                        tags: [.expense],
                        createdAt: Date(),
                        updatedAt: Date()
                    )
                )

                NavigationLinkTransactionItemView(
                    transaction: Transaction(
                        id: "transaction-id-3",
                        entries: [],
                        status: .uncleared,
                        description: "Transaction description",
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
