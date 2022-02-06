import SwiftUI
import ComponentLibrary

struct Breadcrumbs: View {
    private let breadcrumbs: [AnyView]
    private let foregroundColor: Color

    public init<A: View>(
        separator: AnyView = AnyView(defaultSeparator),
        foregroundColor: Color = Color.theme.neutral.n60,
        @ViewBuilder content: @escaping () -> A
    ) {
        let views = [AnyView(content())]
        self.breadcrumbs = views.intersperse(with: separator)
        self.foregroundColor = foregroundColor
    }

    public init<A: View, B: View>(
        separator: AnyView = AnyView(defaultSeparator),
        foregroundColor: Color = Color.theme.neutral.n60,
        @ViewBuilder content: @escaping () -> TupleView<(A, B)>
    ) {
        let (a, b) = content().value
        let views = [AnyView(a), AnyView(b)]
        self.breadcrumbs = views.intersperse(with: separator)
        self.foregroundColor = foregroundColor
    }

    public init<A: View, B: View, C: View>(
        separator: AnyView = AnyView(defaultSeparator),
        foregroundColor: Color = Color.theme.neutral.n60,
        @ViewBuilder content: @escaping () -> TupleView<(A, B, C)>
    ) {
        let (a, b, c) = content().value
        let views = [AnyView(a), AnyView(b), AnyView(c)]
        self.breadcrumbs = views.intersperse(with: separator)
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<breadcrumbs.count) { index in
                breadcrumbs[index]
                    .foregroundColor(foregroundColor)
            }
        }
    }

    private static var defaultSeparator: some View {
        Text("/")
    }
}

struct Breadcrumbs_Previews: PreviewProvider {
    static var previews: some View {
        Breadcrumbs(
            separator: AnyView(Text("--")),
            foregroundColor: Color.theme.neutral.n0
        ) {
            Breadcrumb {
                Text("Breadcrumb 1")
            }
            Breadcrumb {
                Text("Breadcrumb 2")
            }
            Breadcrumb {
                Text("Breadcrumb 3")
            }
        }
    }
}
