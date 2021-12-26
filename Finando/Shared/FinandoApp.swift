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
                        environment: RootEnvironment()
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
