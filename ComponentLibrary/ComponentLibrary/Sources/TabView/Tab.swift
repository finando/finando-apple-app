import SwiftUI

struct Tab {
    let key: AnyHashable
    let content: (_ selected: Bool) -> AnyView
    let colorScheme: ColorScheme
}

extension Tab: Equatable {
    static func == (lhs: Tab, rhs: Tab) -> Bool {
        lhs.key == rhs.key && lhs.colorScheme == rhs.colorScheme
    }
}
