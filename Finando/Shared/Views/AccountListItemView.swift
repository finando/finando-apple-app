import SwiftUI

struct AccountListItemView: View {
    let account: Account
    
    @State private var isHoveringAccoutListItem = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("ACCOUNT: \(account.id) | \(account.name) | \(account.balance.cleared) | \(account.balance.uncleared) | \(account.balance.running)")
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Theme.color.neutral.n0.color)
        .border(isHoveringAccoutListItem ? Theme.color.neutral.n40.color : Theme.color.neutral.n30.color)
        .shadow(color: isHoveringAccoutListItem ? Theme.color.neutral.n20.color : Color.clear, radius: 3, x: 0, y: 0)
        .onHover(perform: { isHoveringAccoutListItem = $0 }, cursor: NSCursor.pointingHand)
    }
}

struct AccountListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let account = Account.BudgetAccount(
            BudgetAccount(
                id: "preivew",
                name: "Preview account",
                balance: Balance(currency: "NOK")
            )
        )

        AccountListItemView(account: account)
    }
}
