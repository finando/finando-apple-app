extension ListAccountsAccountFragment.AsBudgetAccount: AccountFragment {}
extension ListAccountsAccountFragment.AsTrackingAccount: AccountFragment {}
extension GetAccountAccountFragment.AsBudgetAccount: AccountFragment {}
extension GetAccountAccountFragment.AsTrackingAccount: AccountFragment {}
extension CreateBudgetAccountBudgetAccountFragment: AccountFragment {}
extension CreateTrackingAccountTrackingAccountFragment: AccountFragment {}
extension DeleteBudgetAccountBudgetAccountFragment: AccountFragment {}
extension DeleteTrackingAccountTrackingAccountFragment: AccountFragment {}

extension ListAccountsBalanceFragment: BalanceFragment {}
extension GetAccountBalanceFragment: BalanceFragment {}
extension CreateBudgetAccountBalanceFragment: BalanceFragment {}
extension CreateTrackingAccountBalanceFragment: BalanceFragment {}