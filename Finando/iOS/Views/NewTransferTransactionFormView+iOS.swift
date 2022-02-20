import SwiftUI

struct NewTransferTransactionFormView: View {
    var body: some View {
        VStack {
            Text("New transfer transaction")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

struct NewTransferTransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransferTransactionFormView()
    }
}
