struct User {
    let firstName: String
    let lastName: String

    var initials: String {
        "\(firstName.first?.uppercased() ?? "")\(lastName.first?.uppercased() ?? "")"
    }
}
