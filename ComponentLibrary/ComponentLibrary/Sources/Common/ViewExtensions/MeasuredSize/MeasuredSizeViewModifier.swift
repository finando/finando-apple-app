import SwiftUI

struct MeasuredSizeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Color.clear.preference(
                        key: MeasuredSizePreferenceKey.self,
                        value: geometry.size
                    )
                }
            )
    }
}
