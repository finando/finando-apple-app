import SwiftUI
import ComposableArchitecture
import struct ComponentLibrary.TabView

struct RootView: View {
    let store: Store<RootState, RootAction>

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    @State private var showMainActionSheet = false

    var body: some View {
        TabView {
            OverviewView()
                .tabItem(1) { tabItem(selected: $0, icon: "square.grid.2x2", title: "Overview") }

            AccountsView(
                store: store.scope(
                    state: \.accounts,
                    action: RootAction.accounts
                )
            )
                .tabItem(2) { tabItem(selected: $0, icon: "banknote", title: "Accounts") }

            Spacer()
                .sheet(isPresented: $showMainActionSheet) {
                    Text("SHEET!")

                    Button {
                        showMainActionSheet.toggle()
                    } label: {
                        Text("CLOSE")
                    }
                }
                .tabItem(3) { tabButton }

            Text("Budget")
                .tabItem(4) { tabItem(selected: $0, icon: "calendar", title: "Budget") }

            Text("Goals")
                .tabItem(5) { tabItem(selected: $0, icon: "chart.line.uptrend.xyaxis", title: "Goals") }
        }
    }

    @ViewBuilder
    private func tabItem(selected: Bool, icon systemName: String, title: String) -> some View {
        let baseTabItem = VStack(spacing: 3) {
            Image(systemName: systemName)
            Text(title)
                .font(.caption)
        }

        if colorScheme == .dark {
            baseTabItem
                .foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n30 )
        } else {
            baseTabItem
                .foregroundColor(selected ? .theme.blue.b50 : .theme.neutral.n60 )
        }
    }

    @ViewBuilder
    private var tabButton: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                Button {
                    showMainActionSheet.toggle()
                } label: {
                    Image(systemName: "plus.app")
                        .resizable()
                        .padding(6)
                        .foregroundColor(colorScheme == .dark ? .theme.neutral.n30 : .theme.neutral.n60)
                        .frame(width: 50, height: 50)
                        .background {
                            (colorScheme == .dark ? Color(white: 0.15) : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.theme.neutral.n20.opacity(0.5), lineWidth: 2)
                                )
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(
                            color: colorScheme == .dark ? .init(white: 0.05) : .init(white: 0.8),
                            radius: 5
                        )
                }
            }
            .buttonStyle(.plain)
            .offset(y: -25)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
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
                .preferredColorScheme(.light)
                .previewDisplayName("Light mode")

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
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark mode")
        }
    }
}
