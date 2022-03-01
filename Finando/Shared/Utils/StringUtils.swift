extension String {
    func truncate(_ length: Int, trailing: String = "...") -> String {
        (count > length) ? prefix(max(0, length - trailing.count)) + trailing : self
    }
}
