import SwiftUI

enum Theme {
    enum color {
        enum neutral: String {
            case n0 = "Neutral_N0"
            case n10 = "Neutral_N10"
            case n20 = "Neutral_N20"
        }
    }
}

extension Theme.color.neutral {
    var color: Color {
        switch self {
        default:
            return Color.init(self.rawValue)
        }
    }
}
