import Foundation

extension Date {
    func toISO8601Format() -> String {
        if #available(macOS 12.0, *) {
            return self.ISO8601Format()
        } else {
            return ISO8601DateFormatter().string(from: self)
        }
    }
}
