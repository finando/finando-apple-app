import SwiftUI
import ComponentLibrary

struct NavigationLinkAccountItemView: View {
    let account: Account

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
                Image(systemName: account.typeIcon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 15)
                    .foregroundColor(Color.theme.blue.b50)

                VStack(alignment: .leading, spacing: 0) {
                    Text(account.name ?? "")
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n0 : Color.theme.neutral.n60)
                        .font(.system(size: 12, weight: .bold))

                    Text(account.typeTranslation)
                        .foregroundColor(colorScheme == ColorScheme.dark ? Color.theme.neutral.n30 : Color.theme.neutral.n40)
                        .font(.system(size: 11, weight: .regular))
                }
                .padding(.horizontal, 5)

                Spacer()

                VStack(alignment: .trailing, spacing: 0) {
                    Text(account.balance?.runningFormatted ?? "")
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
}

struct NavigationLinkAccountItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyVStack(spacing: 8) {
                NavigationLinkAccountItemView(
                    account: Account.BudgetAccount(
                        .init(
                            id: "account-id-1",
                            name: "Account name",
                            balance: Balance(
                                date: Date(),
                                cleared: 0,
                                uncleared: 0,
                                running: 123456,
                                currency: "NOK"
                            )
                        )
                    )
                )

                NavigationLinkAccountItemView(
                    account: Account.TrackingAccount(
                        .init(
                            id: "account-id-2",
                            name: "Very long account name",
                            balance: Balance(
                                date: Date(),
                                cleared: 0,
                                uncleared: 0,
                                running: 123456789,
                                currency: "NOK"
                            )
                        )
                    )
                )
            }
            .padding()
            .preferredColorScheme(.light)

            LazyVStack(spacing: 8) {
                NavigationLinkAccountItemView(
                    account: Account.BudgetAccount(
                        .init(
                            id: "account-id-1",
                            name: "Account name",
                            balance: Balance(
                                date: Date(),
                                cleared: 0,
                                uncleared: 0,
                                running: 123456,
                                currency: "NOK"
                            )
                        )
                    )
                )

                NavigationLinkAccountItemView(
                    account: Account.TrackingAccount(
                        .init(
                            id: "account-id-2",
                            name: "Very long account name",
                            balance: Balance(
                                date: Date(),
                                cleared: 0,
                                uncleared: 0,
                                running: 123456789,
                                currency: "NOK"
                            )
                        )
                    )
                )
            }
            .padding()
            .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
