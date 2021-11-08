import SwiftUI

enum Theme {
    enum color {
        enum neutral: String {
            case n0 = "Neutral_N0"
            case n10 = "Neutral_N10"
            case n20 = "Neutral_N20"
            case n30 = "Neutral_N30"
            case n40 = "Neutral_N40"
            case n50 = "Neutral_N50"
            case n60 = "Neutral_N60"
        }
        enum blue: String {
            case b40 = "Blue_B40"
            case b50 = "Blue_B50"
            case b60 = "Blue_B60"
            case b70 = "Blue_B70"
            case b80 = "Blue_B80"
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

extension Theme.color.blue {
    var color: Color {
        switch self {
        default:
            return Color.init(self.rawValue)
        }
    }
}
