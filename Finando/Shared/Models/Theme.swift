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
        enum green: String {
            case g30 = "Green_B30"
            case g40 = "Green_B40"
            case g50 = "Green_B50"
            case g60 = "Green_B60"
            case g70 = "Green_B70"
        }
        enum red: String {
            case r40 = "Red_R40"
            case r50 = "Red_R50"
            case r60 = "Red_R60"
            case r70 = "Red_R70"
        }
        enum yellow: String {
            case y30 = "Yellow_Y30"
            case y40 = "Yellow_Y40"
            case y50 = "Yellow_Y50"
            case y60 = "Yellow_Y60"
            case y70 = "Yellow_Y70"
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

extension Theme.color.green {
    var color: Color {
        switch self {
        default:
            return Color.init(self.rawValue)
        }
    }
}

extension Theme.color.red {
    var color: Color {
        switch self {
        default:
            return Color.init(self.rawValue)
        }
    }
}

extension Theme.color.yellow {
    var color: Color {
        switch self {
        default:
            return Color.init(self.rawValue)
        }
    }
}
