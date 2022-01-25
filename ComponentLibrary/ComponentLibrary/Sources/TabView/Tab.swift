import SwiftUI

struct Tab {
    let key: AnyHashable
    let content: AnyView
}

extension Tab: Equatable {
    static func == (lhs: Tab, rhs: Tab) -> Bool {
        lhs.key == rhs.key
    }
}
