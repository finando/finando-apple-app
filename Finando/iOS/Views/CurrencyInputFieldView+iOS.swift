import SwiftUI

struct CurrencyInputFieldView: View {
    let placeholder: String

    @Binding var value: Int

    @FocusState private var isFocused: Bool

    private let currencyFormatter = CurrencyUtils.getCurrencyFormatter()
    
    var body: some View {
        TextField(placeholder, value: $value, formatter: currencyFormatter)
            .focused($isFocused)
            .keyboardType(.decimalPad)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
    }
}

struct CurrencyInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Form {
                Section {
                    CurrencyInputFieldView(placeholder: "Amount", value: .constant(123))
                } header: {
                    Text("Amount")
                } footer: {
                    Text("Enter a curency amount")
                }
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            Form {
                Section {
                    CurrencyInputFieldView(placeholder: "Amount", value: .constant(123))
                } header: {
                    Text("Amount")
                } footer: {
                    Text("Enter a curency amount")
                }
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
    }
}
