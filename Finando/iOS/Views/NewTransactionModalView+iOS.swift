import SwiftUI

struct NewTransactionModalView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Text("HELLO")
                .navigationTitle("New transaction")
        }
    }
}

struct NewTransactionModalView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionModalView()
    }
}
