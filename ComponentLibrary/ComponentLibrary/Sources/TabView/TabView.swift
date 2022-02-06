import SwiftUI

public struct TabView<Key: Hashable, Content: View>: View {
    private let selection: Binding<Key>?
    private let content: Content

    @StateObject private var selectedTab = SelectedTab()

    @State private var tabs: [Tab] = []
    @State private var internalSelection: Key? = nil

    public init(selection: Binding<Key>?, @ViewBuilder content: () -> Content) {
        self.selection = selection
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            .frame(maxHeight: .infinity)

            TabBarView(tabs: tabs, selection: selection ?? .init($internalSelection))
        }
        .onChange(of: selection?.wrappedValue) { updateSelection($0) }
        .onPreferenceChange(TabsPreferenceKey.self) { updateTabs($0) }
        .environmentObject(selectedTab)
    }

    private func updateSelection(_ key: Key?) -> Void {
        if let key = key {
            selectedTab.key = key
        }
    }

    private func updateTabs(_ newTabs: [Tab]) -> Void {
        tabs = newTabs

        if let selection = selection {
            selectedTab.key = selection.wrappedValue
        }

        if let tab = tabs.first, selection == nil {
            internalSelection = tab.key as? Key
            selectedTab.key = tab.key
        }
    }
}

public extension TabView where Key == Int {
    init(@ViewBuilder content: () -> Content) {
        self.selection = nil
        self.content = content()
    }
}

struct TabView_Previews: PreviewProvider {
    static let key: Int = 2

    static var previews: some View {
        TabView(selection: .constant(key)) {
            Text("Tab 1")
                .tabItem(1) {
                    Text("tab 1")
                }

            Text("Tab 2")
                .tabItem(2) {
                    Text("tab 2")
                }

            Text("Tab 3")
                .tabItem(3) {
                    Text("tab 3")
                }
        }
    }
}
