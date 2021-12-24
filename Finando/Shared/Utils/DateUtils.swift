import Foundation

extension Date {
    func toISO8601Format() -> String {
        if #available(macOS 12.0, *) {
            return self.ISO8601Format()
        } else {
            return ISO8601DateFormatter().string(from: self)
        }
    }

    func formatted(format: String) -> String {
        let dateformat = DateFormatter()

        dateformat.dateFormat = format

        return dateformat.string(from: self)
    }
}
