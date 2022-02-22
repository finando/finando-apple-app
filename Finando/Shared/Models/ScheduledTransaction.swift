import Foundation

struct ScheduledTransaction: Identifiable, Equatable, Hashable {
    let id: String
    let entries: [Entry]
    let status: TransactionStatus
    let frequency: Frequency?
    let description: String
    let tags: [Tag]
    let createdAt: Date?
    let updatedAt: Date?

    init(
        id: String,
        entries: [Entry] = [],
        status: TransactionStatus = .uncleared,
        frequency: Frequency? = nil,
        description: String = "",
        tags: [Tag] = [],
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.entries = entries
        self.status = status
        self.frequency = frequency
        self.description = description
        self.tags = tags
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
