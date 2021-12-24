import SwiftUI
import SwiftUIRouter
import Charts

struct AccountView: View {
    let accountId: String;

    @EnvironmentObject var navigator: Navigator

    @StateObject var accountViewModel = AccountViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            breadcrumbs
                .padding(16)

            ScrollView(showsIndicators: false) {
                HStack(spacing: 16) {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Account name")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Theme.color.neutral.n40.color)

                        Text("\(accountViewModel.account?.name ?? "")")
                            .font(.system(size: 16, weight: .bold))
                    }
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 50)
                        .background(Theme.color.neutral.n0.color)
                        .cornerRadius(8)
                        .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                        .foregroundColor(Theme.color.neutral.n60.color)

                    VStack(alignment: .center, spacing: 10) {
                        Text("Account type")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Theme.color.neutral.n40.color)

                        if accountViewModel.account?.isBudgetAccount == true {
                            Text("Budget")
                                .font(.system(size: 16, weight: .bold))
                        }

                        if accountViewModel.account?.isTrackingAccount == true {
                            Text("Tracking")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 50)
                        .background(Theme.color.neutral.n0.color)
                        .cornerRadius(8)
                        .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                        .foregroundColor(Theme.color.neutral.n60.color)

                    VStack(alignment: .center, spacing: 10) {
                        Text("Cleared balance")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Theme.color.neutral.n40.color)

                        Text("\(accountViewModel.account?.balance.clearedFormatted ?? "")")
                            .font(.system(size: 16, weight: .bold))
                    }
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 50)
                        .background(Theme.color.neutral.n0.color)
                        .cornerRadius(8)
                        .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                        .foregroundColor(Theme.color.neutral.n60.color)

                    VStack(alignment: .center, spacing: 10) {
                        Text("Uncleared balance")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Theme.color.neutral.n40.color)

                        Text("\(accountViewModel.account?.balance.unclearedFormatted ?? "")")
                            .font(.system(size: 16, weight: .bold))
                    }
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 50)
                        .background(Theme.color.neutral.n0.color)
                        .cornerRadius(8)
                        .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                        .foregroundColor(Theme.color.neutral.n60.color)

                    VStack(alignment: .center, spacing: 10) {
                        Text("Running balance")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Theme.color.neutral.n40.color)

                        Text("\(accountViewModel.account?.balance.runningFormatted ?? "")")
                            .font(.system(size: 16, weight: .bold))
                    }
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 50)
                        .background(Theme.color.neutral.n0.color)
                        .cornerRadius(8)
                        .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                        .foregroundColor(Theme.color.neutral.n60.color)
                }
                .frame(maxWidth: .infinity, minHeight: 100, alignment: Alignment(horizontal: .leading, vertical: .top))
                .padding(.horizontal, 16)
                .padding(.top, 3)

                balanceChart
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 1050, alignment: Alignment(horizontal: .leading, vertical: .top))
                    .background(Theme.color.neutral.n0.color)
                    .cornerRadius(8)
                    .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
            }
        }
        .onAppear(perform: { accountViewModel.setAccountId(accountId) })
    }

    private var breadcrumbs: some View {
        Breadcrumbs {
            Breadcrumb {
                Text("Overview")
                    .onTapGesture { navigator.navigate(ApplicationRoute.overview.path, replace: false) }
            }
            Breadcrumb {
                Text("Accounts")
                    .onTapGesture { navigator.navigate(ApplicationRoute.accounts.path, replace: false) }
            }
            Breadcrumb(active: true) {
                Text(accountViewModel.account?.name ?? "")
            }
        }
    }

    private var balanceChart: some View {
        let entries = convertBalancesToChartDataEntries(balances: accountViewModel.account?.balances ?? [])

        return LineChartNSViewRepresentable(
            entries: entries,
            minY: 0.0,
            maxY: 20000.0
        )
            .frame(maxWidth: .infinity, minHeight: 350, alignment: Alignment(horizontal: .leading, vertical: .top))
            .padding(24)
            .background(Theme.color.neutral.n0.color)
            .cornerRadius(8)
            .shadow(color: Theme.color.neutral.n20.color, radius: 3, x: 0, y: 0)
    }

    private func convertBalancesToChartDataEntries(balances: [Balance]) -> [ChartDataEntry] {
        return balances.map { balance in
            ChartDataEntry(
                x: balance.date.timeIntervalSince1970 as Double,
                y: Double(balance.running) / 100
            )
        }
    }
}
