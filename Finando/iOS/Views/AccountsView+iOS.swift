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
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(viewStore.accounts) { account in
                            NavigationLink(destination: AccountView(store: store, account: account)) {
                                AccountItemView(account: account)
//                                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
//                                        Button(role: .destructive, action: { print("something") } ) {
//                                            Label("Delete", systemImage: "trash")
//                                        }
//                                    }
                            }
                            .buttonStyle(FlatLinkStyle())
//                            .buttonStyle(PlainButtonStyle())
                        }
                        .onDelete { index in
                            print("DELETE ACCOUNT")
                        }
                    }
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

struct AccountItemView: View {
    let account: Account

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Theme.color.neutral.n0.color)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Theme.color.neutral.n30.color, lineWidth: 2)
                        .foregroundColor(.clear)
                )
                .cornerRadius(10)
//                .shadow(color: Theme.color.neutral.n10.color, radius: 3, x: 2, y: 2)

            HStack(alignment: .center, spacing: 0) {
//                if account.isBudgetAccount {
//                    Image(systemName: "chart.pie.fill")
//                        .padding()
//                } else {
//                    Image(systemName: "chart.bar.fill")
//                        .padding()
//                }
//                Image(systemName: "folder")
//                    .padding()

                VStack(alignment: .leading, spacing: 0) {
                    Text(account.name ?? "")
                        .foregroundColor(Theme.color.neutral.n60.color)
    //                    .padding()
                        .font(.system(size: 14, weight: .heavy))

                    if account.isBudgetAccount {
                        Text("Budget")
                            .foregroundColor(Theme.color.neutral.n40.color)
                            .font(.system(size: 12, weight: .medium))
                    }

                    if account.isTrackingAccount {
                        Text("Tracking")
                            .foregroundColor(Theme.color.neutral.n40.color)
                            .font(.system(size: 12, weight: .medium))
                    }

                    HStack(alignment: .center) {
//                        VStack(alignment: .leading, spacing: 2) {
//                            Text("Cleared")
//                                .font(.system(size: 14, weight: .bold))
//                                .foregroundColor(Theme.color.neutral.n50.color)
//
//                            Text(account.balance.clearedFormatted)
//                                .font(.system(size: 12, weight: .bold))
//                                .foregroundColor(Theme.color.blue.b50.color)
//                        }
//                        .frame(maxWidth: .infinity)
//
//                        VStack(alignment: .leading, spacing: 2) {
//                            Text("Uncleared")
//                                .font(.system(size: 14, weight: .bold))
//                                .foregroundColor(Theme.color.neutral.n50.color)
//
//                            Text(account.balance.unclearedFormatted)
//                                .font(.system(size: 12, weight: .bold))
//                                .foregroundColor(Theme.color.blue.b50.color)
//                        }
//                        .frame(maxWidth: .infinity)

//                        VStack(alignment: .leading, spacing: 2) {
//                            Text("Balance")
//                                .font(.system(size: 14, weight: .bold))
//                                .foregroundColor(Theme.color.neutral.n50.color)
//
//                            Text(account.balance.runningFormatted)
//                                .font(.system(size: 12, weight: .bold))
//                                .foregroundColor(Theme.color.blue.b50.color)
//                        }

//                        VStack(alignment: .leading, spacing: 2) {
//                            Text("Type")
//                                .font(.system(size: 14, weight: .bold))
//                                .foregroundColor(Theme.color.neutral.n50.color)
//
//                            if account.isBudgetAccount {
//                                HStack {
//                                    Text("Budget")
//                                        .font(.system(size: 12, weight: .bold))
//                                        .foregroundColor(Theme.color.blue.b50.color)
//
//                                    Image(systemName: "chart.pie.fill")
//                                }
//                            } else {
//                                HStack {
//                                    Text("Tracking")
//                                        .font(.system(size: 12, weight: .bold))
//                                        .foregroundColor(Theme.color.blue.b50.color)
//
//                                    Image(systemName: "chart.bar.fill")
//                                }
//                            }
//                        }
//                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(10)
//                .padding(.leading, 16)
//                .padding(.vertical, 16)

                Spacer()

                Text(account.balance?.runningFormatted ?? "")
                    .foregroundColor(Theme.color.neutral.n60.color)
                    .font(.system(size: 12, weight: .heavy))
//                    .padding(10)

                Image(systemName: "chevron.forward")
                    .padding(10)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
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
