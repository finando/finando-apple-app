import SwiftUI
import SwiftUIRouter
import ComposableArchitecture
import Charts
import ComponentLibrary

struct AccountView: View {
    let store: Store<AccountState, AccountAction>
    let accountId: String;

    @EnvironmentObject var navigator: Navigator

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading, spacing: 0) {
                breadcrumbs(viewStore: viewStore)
                    .padding(16)

                ScrollView(showsIndicators: false) {
                    HStack(spacing: 16) {
                        VStack(alignment: .center, spacing: 10) {
                            Text("Account name")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.theme.neutral.n40)

                            Text("\(viewStore.account?.name ?? "")")
                                .font(.system(size: 16, weight: .bold))
                        }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 50)
                            .background(Color.theme.neutral.n0)
                            .cornerRadius(8)
                            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                            .foregroundColor(Color.theme.neutral.n60)

                        VStack(alignment: .center, spacing: 10) {
                            Text("Account type")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.theme.neutral.n40)

                            if viewStore.account?.isBudgetAccount == true {
                                Text("Budget")
                                    .font(.system(size: 16, weight: .bold))
                            }

                            if viewStore.account?.isTrackingAccount == true {
                                Text("Tracking")
                                    .font(.system(size: 16, weight: .bold))
                            }
                        }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 50)
                            .background(Color.theme.neutral.n0)
                            .cornerRadius(8)
                            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                            .foregroundColor(Color.theme.neutral.n60)

                        VStack(alignment: .center, spacing: 10) {
                            Text("Cleared balance")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.theme.neutral.n40)

                            Text("\(viewStore.account?.balance.clearedFormatted ?? "")")
                                .font(.system(size: 16, weight: .bold))
                        }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 50)
                            .background(Color.theme.neutral.n0)
                            .cornerRadius(8)
                            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                            .foregroundColor(Color.theme.neutral.n60)

                        VStack(alignment: .center, spacing: 10) {
                            Text("Uncleared balance")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.theme.neutral.n40)

                            Text("\(viewStore.account?.balance.unclearedFormatted ?? "")")
                                .font(.system(size: 16, weight: .bold))
                        }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 50)
                            .background(Color.theme.neutral.n0)
                            .cornerRadius(8)
                            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                            .foregroundColor(Color.theme.neutral.n60)

                        VStack(alignment: .center, spacing: 10) {
                            Text("Running balance")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.theme.neutral.n40)

                            Text("\(viewStore.account?.balance.runningFormatted ?? "")")
                                .font(.system(size: 16, weight: .bold))
                        }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 50)
                            .background(Color.theme.neutral.n0)
                            .cornerRadius(8)
                            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                            .foregroundColor(Color.theme.neutral.n60)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, alignment: Alignment(horizontal: .leading, vertical: .top))
                    .padding(.horizontal, 16)
                    .padding(.top, 3)

                    balanceChart(viewStore: viewStore)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)

                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 1050, alignment: Alignment(horizontal: .leading, vertical: .top))
                        .background(Color.theme.neutral.n0)
                        .cornerRadius(8)
                        .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            .onAppear { viewStore.send(.getAccountRequested(id: accountId)) }
        }
    }

    private func breadcrumbs(viewStore: ViewStore<AccountState, AccountAction>) -> some View {
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
                Text(viewStore.account?.name ?? "")
            }
        }
    }

    private func balanceChart(viewStore: ViewStore<AccountState, AccountAction>) -> some View {
        let entries = convertBalancesToChartDataEntries(balances: viewStore.account?.balances ?? [])

        return LineChartNSViewRepresentable(
            entries: entries,
            minY: 0.0,
            maxY: 20000.0
        )
            .frame(maxWidth: .infinity, minHeight: 350, alignment: Alignment(horizontal: .leading, vertical: .top))
            .padding(24)
            .background(Color.theme.neutral.n0)
            .cornerRadius(8)
            .shadow(color: Color.theme.neutral.n20, radius: 3, x: 0, y: 0)
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
