class SelectedTab: ObservableObject {
    @Published var key: AnyHashable?

    init() {

    }

    init(key: AnyHashable) {
        self.key = key
    }
}
