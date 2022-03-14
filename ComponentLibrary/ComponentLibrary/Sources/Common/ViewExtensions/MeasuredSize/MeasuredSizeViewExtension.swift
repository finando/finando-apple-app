import SwiftUI

public extension View {
    func measuredSize(perform action: @escaping (CGSize) -> Void) -> some View {
        modifier(MeasuredSizeViewModifier())
            .onPreferenceChange(MeasuredSizePreferenceKey.self, perform: action)
    }
}
