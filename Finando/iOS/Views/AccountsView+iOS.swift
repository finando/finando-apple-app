import SwiftUI
import ComposableArchitecture

struct AccountsView: View {
    let store: Store<AccountsState, AccountsAction>

    @Environment(\.editMode) private var editMode

    @State private var showNewAccountSheet = false
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 8) {
                        ForEach(viewStore.accounts) { account in
                            NavigationLink(destination: AccountView(store: store, account: account)) {
                                NavigationLinkAccountItemView(account: account)
                                    .padding(.horizontal, 16)
                            }
                            .buttonStyle(FlatLinkStyle())
                        }
                        .onDelete { index in
                            print("DELETE ACCOUNT")
                        }
                    }
                    .padding(.vertical, 16)
                    .highPriorityGesture(DragGesture(minimumDistance: 25, coordinateSpace: .local)
                                            .onEnded { value in
                        print("DRAG: \(value)")
//                        if abs(value.translation.height) < abs(value.translation.width) {
//                            if abs(value.translation.width) > 50.0 {
//                                if value.translation.width < 0 {
//                                    self.swipeRightToLeft()
//                                } else if value.translation.width > 0 {
//                                    self.swipeLeftToRight()
//                                }
//                            }
//                        }
                    }
                    )
                }
                .navigationTitle(editMode?.wrappedValue == .active ? "Edit accounts" : "Accounts")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Menu {
                            Button {
                                showNewAccountSheet = true
                            } label: {
                                Label("New account", systemImage: "rectangle.stack.badge.plus")
                            }

                            Button {
                                editMode?.wrappedValue = .active
                            } label: {
                                Label("Edit", systemImage: "rectangle.stack.badge.plus")
                            }
                        } label: {
                            Image(systemName: "plus.square")
                        }
                    }
                }
                .sheet(isPresented: $showNewAccountSheet) {
                    NewAccountModalView(store: store)
                }
            }
            .onAppear {
                viewStore.send(.listAccountsRequested)
            }
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(
            store: Store(
                initialState: AccountsState(),
                reducer: accountsReducer,
                environment: AccountsEnvironment(
                    mainQueue: .main,
                    accountService: AccountService(apolloClient: Network.shared.apollo)
                )
            )
        )
    }
}
