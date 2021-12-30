import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<RootState, RootAction>

    var body: some View {
        TabView {
            ForEach(ApplicationTab.allCases, id: \.self) { tab in
                tab.view(store: store)
                    .tabItem {
                        Label(tab.translation, systemImage: tab.icon)
                    }
            }
        }
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
