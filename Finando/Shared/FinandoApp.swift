import SwiftUI
import SwiftUIRouter
import ComposableArchitecture

enum RootScene {  }

@main
struct FinandoApp: App {
    var body: some Scene {
        #if canImport(UIKit)
            RootScene.iOS
        #else
            RootScene.macOS
        #endif
    }
}
