import SwiftUI

struct TabItemViewModifier: ViewModifier {
    let key: AnyHashable
    let tabFactory: (_ colorScheme: ColorScheme) -> Tab

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    @EnvironmentObject private var selectedTab: SelectedTab

    func body(content: Content) -> some View {
        content
            .opacity(key == selectedTab.key ? 1 : 0)
            .preference(key: TabsPreferenceKey.self, value: [tabFactory(colorScheme)])
    }
}
