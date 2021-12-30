import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

extension RootScene {
    static var macOS: some Scene {
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
            .onAppear { NSWindow.allowsAutomaticWindowTabbing = false }
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: false))
    }
}
