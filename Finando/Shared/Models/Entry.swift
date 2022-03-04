struct Entry: Identifiable, Equatable, Hashable, Codable {
    let id: String
    let account: String
    let debit: Int
    let credit: Int
    let currency: String
}
