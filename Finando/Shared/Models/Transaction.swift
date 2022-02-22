import Foundation

struct Transaction: Identifiable, Equatable, Hashable {
    let id: String
    let entries: [Entry]
    let status: TransactionStatus
    let description: String
    let tags: [Tag]
    let createdAt: Date?
    let updatedAt: Date?

    init(
        id: String,
        entries: [Entry] = [],
        status: TransactionStatus = .uncleared,
        description: String = "",
        tags: [Tag] = [],
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.entries = entries
        self.status = status
        self.description = description
        self.tags = tags
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

