import SwiftUI

struct TabBarView<Key: Hashable>: View {
    let tabs: [Tab]
    let selection: Binding<Key>?

    @EnvironmentObject private var selectedTab: SelectedTab

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(tabs, id: \.key) { tab in
                render(tab)
                    .onTapGesture { updateSelection(tab.key as! Key) }
            }
        }
        .padding(.vertical, 12)
        .background { tabBarBackground }
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    private var tabBarBackground: some View {
        if colorScheme == .dark {
            Color(white: 0.15)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.neutral.n50, lineWidth: 1)
                )
                .shadow(color: .init(white: 0.1), radius: 5)
        } else {
            Color.white
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.neutral.n20.opacity(0.5), lineWidth: 1)
                )
                .shadow(color: .init(white: 0.9), radius: 5)
        }
    }

    private func render(_ tab: Tab) -> some View {
        tab.content(tab.key == selectedTab.key)
            .fixedSize()
            .frame(maxWidth: .infinity)
    }

    private func updateSelection(_ key: Key) -> Void {
        selection?.wrappedValue = key
        selectedTab.key = key
    }
}

struct TabBarView_Previews: PreviewProvider {
    static let lightModeTabs: [Tab] = [
        Tab(key: 1, content: { selected in AnyView(Text("Tab 1").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n60 )) }),
        Tab(key: 2, content: { selected in AnyView(Text("Tab 2").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n60 )) }),
        Tab(key: 3, content: { selected in AnyView(Text("Tab 3").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n60 )) }),
        Tab(key: 4, content: { selected in AnyView(Text("Tab 4").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n60 )) }),
    ]
    static let darkModeTabs: [Tab] = [
        Tab(key: 1, content: { selected in AnyView(Text("Tab 1").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n0 )) }),
        Tab(key: 2, content: { selected in AnyView(Text("Tab 2").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n0 )) }),
        Tab(key: 3, content: { selected in AnyView(Text("Tab 3").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n0 )) }),
        Tab(key: 4, content: { selected in AnyView(Text("Tab 4").foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n0 )) }),
    ]
    static let key: Int = 2

    static var previews: some View {
        Group {
            TabBarView(
                tabs: lightModeTabs,
                selection: .constant(key)
            )
                .preferredColorScheme(.light)
                .previewDisplayName("Light mode")

            TabBarView(
                tabs: darkModeTabs,
                selection: .constant(key)
            )
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark mode")
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(SelectedTab(key: key))
        .padding(.vertical, 16)
    }
}
