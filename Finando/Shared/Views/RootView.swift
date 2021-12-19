import SwiftUI
import SwiftUIRouter

struct RootView: View {
    var body: some View {
        HStack(spacing: 0) {
            SideMenuView()

            VStack(spacing: 0) {
                HeaderView()

                SwitchRoutes {
                    Route(path: ApplicationRoute.overview.path) {
                        Text("overview")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.red)
                    }
                    Route(path: ApplicationRoute.accounts.path) {
                        AccountsView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                    }
                    Route(path: ApplicationRoute.account(":accountId").path) { info in
                        AccountView(accountId: info.parameters["accountId"]!)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                    }
                    Route(path: ApplicationRoute.budget.path) {
                        Text("budget")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.blue)
                    }
                    Route(path: ApplicationRoute.goals.path) {
                        Text("goals")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
                            .background(Color.yellow)
                    }
                    Route(path: ApplicationRoute.projections.path) {
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
        RootView()
    }
}
