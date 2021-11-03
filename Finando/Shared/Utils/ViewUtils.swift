import SwiftUI

extension View {
    public func onHover(perform action: @escaping (Bool) -> Void, cursor: NSCursor) -> some View {
        self.onHover { value in
            DispatchQueue.main.async {
                if value {
                    cursor.push()
                } else {
                    NSCursor.pop()
                }
            }

            action(value)
        }
    }
}
