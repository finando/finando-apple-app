import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

extension RootScene {
    static var iOS: some Scene {
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
    }
}
