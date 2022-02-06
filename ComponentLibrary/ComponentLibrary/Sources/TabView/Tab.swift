import SwiftUI

struct Tab {
    let key: AnyHashable
    let content: (_ selected: Bool) -> AnyView
}

extension Tab: Equatable {
    static func == (lhs: Tab, rhs: Tab) -> Bool {
        lhs.key == rhs.key
    }
}