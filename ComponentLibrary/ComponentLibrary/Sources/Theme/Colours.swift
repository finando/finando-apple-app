import SwiftUI

private class ThisBundle {}

public extension Color {
    enum theme {
        public enum neutral {
            public static let n0 = Color("Neutral_N0", bundle: Bundle(for: ThisBundle.self))
            public static let n10 = Color("Neutral_N10", bundle: Bundle(for: ThisBundle.self))
            public static let n20 = Color("Neutral_N20", bundle: Bundle(for: ThisBundle.self))
            public static let n30 = Color("Neutral_N30", bundle: Bundle(for: ThisBundle.self))
            public static let n40 = Color("Neutral_N40", bundle: Bundle(for: ThisBundle.self))
            public static let n50 = Color("Neutral_N50", bundle: Bundle(for: ThisBundle.self))
            public static let n60 = Color("Neutral_N60", bundle: Bundle(for: ThisBundle.self))
        }

        public enum blue {
            public static let b40 = Color("Blue_B40", bundle: Bundle(for: ThisBundle.self))
            public static let b50 = Color("Blue_B50", bundle: Bundle(for: ThisBundle.self))
            public static let b60 = Color("Blue_B60", bundle: Bundle(for: ThisBundle.self))
            public static let b70 = Color("Blue_B70", bundle: Bundle(for: ThisBundle.self))
            public static let b80 = Color("Blue_B80", bundle: Bundle(for: ThisBundle.self))
        }

        public enum green {
            public static let g30 = Color("Green_G30", bundle: Bundle(for: ThisBundle.self))
            public static let g40 = Color("Green_G40", bundle: Bundle(for: ThisBundle.self))
            public static let g50 = Color("Green_G50", bundle: Bundle(for: ThisBundle.self))
            public static let g60 = Color("Green_G60", bundle: Bundle(for: ThisBundle.self))
            public static let g70 = Color("Green_G70", bundle: Bundle(for: ThisBundle.self))
        }

        public enum red {
            public static let r40 = Color("Red_R40", bundle: Bundle(for: ThisBundle.self))
            public static let r50 = Color("Red_R50", bundle: Bundle(for: ThisBundle.self))
            public static let r60 = Color("Red_R60", bundle: Bundle(for: ThisBundle.self))
            public static let r70 = Color("Red_R70", bundle: Bundle(for: ThisBundle.self))
        }

        public enum yellow {
            public static let y30 = Color("Yellow_Y30", bundle: Bundle(for: ThisBundle.self))
            public static let y40 = Color("Yellow_Y40", bundle: Bundle(for: ThisBundle.self))
            public static let y50 = Color("Yellow_Y50", bundle: Bundle(for: ThisBundle.self))
            public static let y60 = Color("Yellow_Y60", bundle: Bundle(for: ThisBundle.self))
            public static let y70 = Color("Yellow_Y70", bundle: Bundle(for: ThisBundle.self))
        }
    }
}
