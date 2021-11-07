import SwiftUI

extension View {
    public func onHover(perform action: @escaping (Bool) -> Void, cursor: NSCursor? = nil) -> some View {
        modifier(HoverViewModifier(action: action, cursor: cursor))
    }
}
