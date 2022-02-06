import SwiftUI

public extension View {
    func tabItem<Key: Hashable, Content: View>(_ key: Key, @ViewBuilder _ content: @escaping () -> Content) -> some View {
        modifier(
            TabItemViewModifier(
                tab: Tab(
                    key: key,
                    content: { _ in AnyView(content()) }
                )
            )
        )
    }

    func tabItem<Key: Hashable, Content: View>(_ key: Key, @ViewBuilder _ content: @escaping (_ selected: Bool) -> Content) -> some View {
        modifier(
            TabItemViewModifier(
                tab: Tab(
                    key: key,
                    content: { selected in AnyView(content(selected)) }
                )
            )
        )
    }
}
