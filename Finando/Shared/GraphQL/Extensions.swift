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

extension ListTransactionsTransactionFragment: TransactionFragment {}
extension ListLatestTransactionsTransactionFragment: TransactionFragment {}
extension CreateTransactionTransactionFragment: TransactionFragment {}
extension DeleteTransactionTransactionFragment: TransactionFragment {}

extension ListScheduledTransactionsScheduledTransactionFragment: ScheduledTransactionFragment {}

extension ListTransactionsTransactionFragment.Entry: EntryFragment {}
extension ListLatestTransactionsTransactionFragment.Entry: EntryFragment {}
extension ListScheduledTransactionsScheduledTransactionFragment.Entry: EntryFragment {}
extension CreateTransactionTransactionFragment.Entry: EntryFragment {}
extension DeleteTransactionTransactionFragment.Entry: EntryFragment {}
