import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

@main
struct FinandoApp: App {
    var body: some Scene {
        WindowGroup {
            Router {
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
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: false))
    }
}
