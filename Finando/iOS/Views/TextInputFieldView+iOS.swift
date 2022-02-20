import SwiftUI

struct TextInputFieldView: View {
    let placeholder: String

    @Binding var value: String

    @FocusState private var isFocused: Bool

    var body: some View {
        TextField(placeholder, text: $value)
            .focused($isFocused)
            .keyboardType(.default)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
    }
}

struct TextInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Form {
                Section {
                    TextInputFieldView(placeholder: "Description", value: .constant(""))
                } header: {
                    Text("Description")
                } footer: {
                    Text("Describe something")
                }
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light mode")

            Form {
                Section {
                    TextInputFieldView(placeholder: "Description", value: .constant(""))
                } header: {
                    Text("Description")
                } footer: {
                    Text("Describe something")
                }
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark mode")
        }
    }
}
