import IdentifiedCollections

struct AccountsState: Equatable {
    var accounts: IdentifiedArrayOf<Account> = []
    var isLoadingAccounts: Bool = false
    var isCreatingAccount: Bool = false
    var isDeletingAccount: Bool = false
}
