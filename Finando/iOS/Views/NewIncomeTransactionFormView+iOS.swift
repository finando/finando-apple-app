import SwiftUI

struct NewIncomeTransactionFormView: View {
    var body: some View {
        VStack {
            HStack {
                Text("New income transaction")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

struct NewIncomeTransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewIncomeTransactionFormView()
    }
}
