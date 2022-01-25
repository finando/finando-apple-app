import SwiftUI

struct TabsPreferenceKey: PreferenceKey {
    static var defaultValue: [Tab] = []

    static func reduce(value: inout [Tab], nextValue: () -> [Tab]) {
        value += nextValue()
    }
}
