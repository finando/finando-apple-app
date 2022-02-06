import SwiftUI

struct TabBarView<Key: Hashable>: View {
    let tabs: [Tab]
    let selection: Binding<Key>?

    @EnvironmentObject private var selectedTab: SelectedTab

    var body: some View {
        HStack(spacing: 0) {
            Group {
                ForEach(tabs, id: \.key) { tab in
                    render(tab)
                        .onTapGesture { updateSelection(tab.key as! Key) }
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

    private func render(_ tab: Tab) -> some View {
        tab.content(tab.key == selectedTab.key)
            .frame(maxWidth: .infinity)
            .background {
                tab.key == selectedTab.key ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
            }
    }

    private func updateSelection(_ key: Key) -> Void {
        selection?.wrappedValue = key
        selectedTab.key = key
    }
}

struct TabBarView_Previews: PreviewProvider {
    static let tabs: [Tab] = [
        Tab(key: 1, content: { selected in AnyView(Text("Tab 1").foregroundColor(selected ? .blue : .black )) }),
        Tab(key: 2, content: { selected in AnyView(Text("Tab 2").foregroundColor(selected ? .blue : .black )) }),
        Tab(key: 3, content: { selected in AnyView(Text("Tab 3").foregroundColor(selected ? .blue : .black )) }),
        Tab(key: 4, content: { selected in AnyView(Text("Tab 4").foregroundColor(selected ? .blue : .black )) }),
    ]
    static let key: Int = 2

    static var previews: some View {
        TabBarView(
            tabs: tabs,
            selection: .constant(key)
        )
            .environmentObject(SelectedTab(key: key))
    }
}
