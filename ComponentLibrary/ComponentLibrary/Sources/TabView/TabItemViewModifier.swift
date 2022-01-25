import SwiftUI

struct TabItemViewModifier: ViewModifier {
    let tab: Tab

    @EnvironmentObject private var selectedTab: SelectedTab

    func body(content: Content) -> some View {
        content
            .opacity(tab.key == selectedTab.key ? 1 : 0)
            .preference(key: TabsPreferenceKey.self, value: [tab])
    }
}
