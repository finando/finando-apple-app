import SwiftUI

struct Breadcrumb<Content: View>: View {
    private let content: Content
    private let active: Bool
    
    @State private var isHoveringOverBreadcrumb = false

    public init(
        active: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.active = active
    }

    var body: some View {
        if active {
            content
                .padding(.bottom, 2)
                .overlay(
                    Rectangle()
                        .frame(height: 1),
                    alignment: .bottom)
        } else {
            content
                .padding(.bottom, 2)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .opacity(isHoveringOverBreadcrumb ? 1 : 0),
                    alignment: .bottom)
                .onHover(perform: { isHoveringOverBreadcrumb = $0 }, cursor: NSCursor.pointingHand)
        }
    }
}

struct Breadcrumb_Previews: PreviewProvider {
    static var previews: some View {
        Breadcrumb {
            Text("Breadcrumb")
        }
    }
}
