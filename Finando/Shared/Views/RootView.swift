import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

struct RootView: View {
    let store: Store<RootState, RootAction>

    var body: some View {
        HStack(spacing: 0) {
            SideMenuView()

            VStack(spacing: 0) {
                HeaderView()

                SwitchRoutes {
                    Route(ApplicationRoute.overview.path) {
                        Text("overview")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.red)
                    }
                    Route(ApplicationRoute.accounts.path) {
                        AccountsView(
                            store: store.scope(state: \.accounts, action: RootAction.accounts)
                        )
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                    }
                    Route(ApplicationRoute.account(":accountId").path) { info in
                        AccountView(
                            store: store.scope(state: \.account, action: RootAction.account),
                            accountId: info.parameters["accountId"]!
                        )
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                    }
                    Route(ApplicationRoute.budget.path) {
                        Text("budget")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.blue)
                    }
                    Route(ApplicationRoute.goals.path) {
                        Text("goals")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.yellow)
                    }
                    Route(ApplicationRoute.projections.path) {
                        Text("projections")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.orange)
                    }
                }
            }
        }
        .background(Theme.color.neutral.n10.color)
        .ignoresSafeArea()
        .onAppear { NSWindow.allowsAutomaticWindowTabbing = false }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment(
                    mainQueue: .main,
                    apolloClient: Network.shared.apollo
                )
            )
        )
    }
}
