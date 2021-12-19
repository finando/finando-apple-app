import Foundation

extension Array {
    public func intersperse(with element: Element) -> Array {
        flatMap { [$0, element] }.dropLast()
    }
}
