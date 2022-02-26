struct Pagination: Equatable {
    let cursor: String?
    let take: Int?

    init(cursor: String? = nil, take: Int? = nil) {
        self.cursor = cursor
        self.take = take
    }
}
