import SwiftUI

public extension View {
    func tabItem<Key: Hashable, Content: View>(_ key: Key, @ViewBuilder _ content: () -> Content) -> some View {
        modifier(
            TabItemViewModifier(
                tab: Tab(
                    key: key,
                    content: AnyView(content())
                )
            )
        )
    }
}
