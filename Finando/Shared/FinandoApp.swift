import SwiftUI
import SwiftUIRouter

@main
struct FinandoApp: App {
    var body: some Scene {
        WindowGroup {
            Router {
                RootView()
            }
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: false))
    }
}
