// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CreateBudgetAccountInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - initialBalance
  ///   - name
  ///   - type
  public init(initialBalance: Swift.Optional<Int?> = nil, name: Swift.Optional<String?> = nil, type: BudgetAccountType) {
    graphQLMap = ["initialBalance": initialBalance, "name": name, "type": type]
  }

  public var initialBalance: Swift.Optional<Int?> {
    get {
      return graphQLMap["initialBalance"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "initialBalance")
    }
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var type: BudgetAccountType {
    get {
      return graphQLMap["type"] as! BudgetAccountType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public enum BudgetAccountType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case cash
  case checking
  case creditCard
  case lineOfCredit
  case savings
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CASH": self = .cash
      case "CHECKING": self = .checking
      case "CREDIT_CARD": self = .creditCard
      case "LINE_OF_CREDIT": self = .lineOfCredit
      case "SAVINGS": self = .savings
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .cash: return "CASH"
      case .checking: return "CHECKING"
      case .creditCard: return "CREDIT_CARD"
      case .lineOfCredit: return "LINE_OF_CREDIT"
      case .savings: return "SAVINGS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: BudgetAccountType, rhs: BudgetAccountType) -> Bool {
    switch (lhs, rhs) {
      case (.cash, .cash): return true
      case (.checking, .checking): return true
      case (.creditCard, .creditCard): return true
      case (.lineOfCredit, .lineOfCredit): return true
      case (.savings, .savings): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [BudgetAccountType] {
    return [
      .cash,
      .checking,
      .creditCard,
      .lineOfCredit,
      .savings,
    ]
  }
}

public struct CreateTrackingAccountInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - initialBalance
  ///   - name
  ///   - type
  public init(initialBalance: Swift.Optional<Int?> = nil, name: Swift.Optional<String?> = nil, type: TrackingAccountType) {
    graphQLMap = ["initialBalance": initialBalance, "name": name, "type": type]
  }

  public var initialBalance: Swift.Optional<Int?> {
    get {
      return graphQLMap["initialBalance"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "initialBalance")
    }
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var type: TrackingAccountType {
    get {
      return graphQLMap["type"] as! TrackingAccountType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public enum TrackingAccountType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case asset
  case liability
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ASSET": self = .asset
      case "LIABILITY": self = .liability
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .asset: return "ASSET"
      case .liability: return "LIABILITY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TrackingAccountType, rhs: TrackingAccountType) -> Bool {
    switch (lhs, rhs) {
      case (.asset, .asset): return true
      case (.liability, .liability): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TrackingAccountType] {
    return [
      .asset,
      .liability,
    ]
  }
}

public enum Frequency: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case annually
  case daily
  case monthly
  case weekly
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ANNUALLY": self = .annually
      case "DAILY": self = .daily
      case "MONTHLY": self = .monthly
      case "WEEKLY": self = .weekly
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .annually: return "ANNUALLY"
      case .daily: return "DAILY"
      case .monthly: return "MONTHLY"
      case .weekly: return "WEEKLY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Frequency, rhs: Frequency) -> Bool {
    switch (lhs, rhs) {
      case (.annually, .annually): return true
      case (.daily, .daily): return true
      case (.monthly, .monthly): return true
      case (.weekly, .weekly): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Frequency] {
    return [
      .annually,
      .daily,
      .monthly,
      .weekly,
    ]
  }
}

public final class CreateBudgetAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateBudgetAccount($data: CreateBudgetAccountInput!, $balanceToDate: DateTime!) {
      account: createBudgetAccount(data: $data) {
        __typename
        ...CreateBudgetAccount_BudgetAccountFragment
      }
    }
    """

  public let operationName: String = "CreateBudgetAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CreateBudgetAccountBudgetAccountFragment.fragmentDefinition)
    document.append("\n" + CreateBudgetAccountBalanceFragment.fragmentDefinition)
    return document
  }

  public var data: CreateBudgetAccountInput
  public var balanceToDate: String

  public init(data: CreateBudgetAccountInput, balanceToDate: String) {
    self.data = data
    self.balanceToDate = balanceToDate
  }

  public var variables: GraphQLMap? {
    return ["data": data, "balanceToDate": balanceToDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createBudgetAccount", alias: "account", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(Account.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(account: Account) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "account": account.resultMap])
    }

    public var account: Account {
      get {
        return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "account")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BudgetAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CreateBudgetAccountBudgetAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var createBudgetAccountBudgetAccountFragment: CreateBudgetAccountBudgetAccountFragment {
          get {
            return CreateBudgetAccountBudgetAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreateTrackingAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateTrackingAccount($data: CreateTrackingAccountInput!, $balanceToDate: DateTime!) {
      account: createTrackingAccount(data: $data) {
        __typename
        ...CreateTrackingAccount_TrackingAccountFragment
      }
    }
    """

  public let operationName: String = "CreateTrackingAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CreateTrackingAccountTrackingAccountFragment.fragmentDefinition)
    document.append("\n" + CreateTrackingAccountBalanceFragment.fragmentDefinition)
    return document
  }

  public var data: CreateTrackingAccountInput
  public var balanceToDate: String

  public init(data: CreateTrackingAccountInput, balanceToDate: String) {
    self.data = data
    self.balanceToDate = balanceToDate
  }

  public var variables: GraphQLMap? {
    return ["data": data, "balanceToDate": balanceToDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createTrackingAccount", alias: "account", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(Account.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(account: Account) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "account": account.resultMap])
    }

    public var account: Account {
      get {
        return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "account")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TrackingAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CreateTrackingAccountTrackingAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var createTrackingAccountTrackingAccountFragment: CreateTrackingAccountTrackingAccountFragment {
          get {
            return CreateTrackingAccountTrackingAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeleteBudgetAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteBudgetAccount($id: ID!) {
      account: deleteBudgetAccount(id: $id) {
        __typename
        ...DeleteBudgetAccount_BudgetAccountFragment
      }
    }
    """

  public let operationName: String = "DeleteBudgetAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeleteBudgetAccountBudgetAccountFragment.fragmentDefinition)
    return document
  }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteBudgetAccount", alias: "account", arguments: ["id": GraphQLVariable("id")], type: .object(Account.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(account: Account? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "account": account.flatMap { (value: Account) -> ResultMap in value.resultMap }])
    }

    public var account: Account? {
      get {
        return (resultMap["account"] as? ResultMap).flatMap { Account(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "account")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BudgetAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeleteBudgetAccountBudgetAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "BudgetAccount", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deleteBudgetAccountBudgetAccountFragment: DeleteBudgetAccountBudgetAccountFragment {
          get {
            return DeleteBudgetAccountBudgetAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeleteTrackingAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteTrackingAccount($id: ID!) {
      account: deleteTrackingAccount(id: $id) {
        __typename
        ...DeleteTrackingAccount_TrackingAccountFragment
      }
    }
    """

  public let operationName: String = "DeleteTrackingAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeleteTrackingAccountTrackingAccountFragment.fragmentDefinition)
    return document
  }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteTrackingAccount", alias: "account", arguments: ["id": GraphQLVariable("id")], type: .object(Account.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(account: Account? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "account": account.flatMap { (value: Account) -> ResultMap in value.resultMap }])
    }

    public var account: Account? {
      get {
        return (resultMap["account"] as? ResultMap).flatMap { Account(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "account")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TrackingAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeleteTrackingAccountTrackingAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "TrackingAccount", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deleteTrackingAccountTrackingAccountFragment: DeleteTrackingAccountTrackingAccountFragment {
          get {
            return DeleteTrackingAccountTrackingAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetAccountQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAccount($id: ID!, $balanceToDate: DateTime!, $balancesFromDate: DateTime!, $balancesToDate: DateTime!, $frequency: Frequency!) {
      account: getAccount(id: $id) {
        __typename
        ...GetAccount_AccountFragment
      }
    }
    """

  public let operationName: String = "GetAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + GetAccountAccountFragment.fragmentDefinition)
    document.append("\n" + GetAccountBalanceFragment.fragmentDefinition)
    return document
  }

  public var id: GraphQLID
  public var balanceToDate: String
  public var balancesFromDate: String
  public var balancesToDate: String
  public var frequency: Frequency

  public init(id: GraphQLID, balanceToDate: String, balancesFromDate: String, balancesToDate: String, frequency: Frequency) {
    self.id = id
    self.balanceToDate = balanceToDate
    self.balancesFromDate = balancesFromDate
    self.balancesToDate = balancesToDate
    self.frequency = frequency
  }

  public var variables: GraphQLMap? {
    return ["id": id, "balanceToDate": balanceToDate, "balancesFromDate": balancesFromDate, "balancesToDate": balancesToDate, "frequency": frequency]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAccount", alias: "account", arguments: ["id": GraphQLVariable("id")], type: .object(Account.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(account: Account? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "account": account.flatMap { (value: Account) -> ResultMap in value.resultMap }])
    }

    public var account: Account? {
      get {
        return (resultMap["account"] as? ResultMap).flatMap { Account(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "account")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BudgetAccount", "TrackingAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetAccountAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getAccountAccountFragment: GetAccountAccountFragment {
          get {
            return GetAccountAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ListAccountsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListAccounts($balanceToDate: DateTime!) {
      accounts: listAccounts {
        __typename
        ...ListAccounts_AccountFragment
      }
    }
    """

  public let operationName: String = "ListAccounts"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ListAccountsAccountFragment.fragmentDefinition)
    document.append("\n" + ListAccountsBalanceFragment.fragmentDefinition)
    return document
  }

  public var balanceToDate: String

  public init(balanceToDate: String) {
    self.balanceToDate = balanceToDate
  }

  public var variables: GraphQLMap? {
    return ["balanceToDate": balanceToDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listAccounts", alias: "accounts", type: .nonNull(.list(.nonNull(.object(Account.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(accounts: [Account]) {
      self.init(unsafeResultMap: ["__typename": "Query", "accounts": accounts.map { (value: Account) -> ResultMap in value.resultMap }])
    }

    public var accounts: [Account] {
      get {
        return (resultMap["accounts"] as! [ResultMap]).map { (value: ResultMap) -> Account in Account(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Account) -> ResultMap in value.resultMap }, forKey: "accounts")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BudgetAccount", "TrackingAccount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ListAccountsAccountFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var listAccountsAccountFragment: ListAccountsAccountFragment {
          get {
            return ListAccountsAccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct CreateBudgetAccountBalanceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CreateBudgetAccount_BalanceFragment on Balance {
      __typename
      date
      currency
      cleared
      uncleared
      running
    }
    """

  public static let possibleTypes: [String] = ["Balance"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("date", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("cleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("uncleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("running", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
    self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var cleared: Int {
    get {
      return resultMap["cleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "cleared")
    }
  }

  public var uncleared: Int {
    get {
      return resultMap["uncleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "uncleared")
    }
  }

  public var running: Int {
    get {
      return resultMap["running"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "running")
    }
  }
}

public struct CreateBudgetAccountBudgetAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CreateBudgetAccount_BudgetAccountFragment on BudgetAccount {
      __typename
      id
      name
      balance(to: $balanceToDate) {
        __typename
        ...CreateBudgetAccount_BalanceFragment
      }
    }
    """

  public static let possibleTypes: [String] = ["BudgetAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, balance: Balance) {
    self.init(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var balance: Balance {
    get {
      return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "balance")
    }
  }

  public struct Balance: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Balance"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CreateBudgetAccountBalanceFragment.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
      self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var createBudgetAccountBalanceFragment: CreateBudgetAccountBalanceFragment {
        get {
          return CreateBudgetAccountBalanceFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct CreateTrackingAccountBalanceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CreateTrackingAccount_BalanceFragment on Balance {
      __typename
      date
      currency
      cleared
      uncleared
      running
    }
    """

  public static let possibleTypes: [String] = ["Balance"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("date", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("cleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("uncleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("running", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
    self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var cleared: Int {
    get {
      return resultMap["cleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "cleared")
    }
  }

  public var uncleared: Int {
    get {
      return resultMap["uncleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "uncleared")
    }
  }

  public var running: Int {
    get {
      return resultMap["running"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "running")
    }
  }
}

public struct CreateTrackingAccountTrackingAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CreateTrackingAccount_TrackingAccountFragment on TrackingAccount {
      __typename
      id
      name
      balance(to: $balanceToDate) {
        __typename
        ...CreateTrackingAccount_BalanceFragment
      }
    }
    """

  public static let possibleTypes: [String] = ["TrackingAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, balance: Balance) {
    self.init(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var balance: Balance {
    get {
      return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "balance")
    }
  }

  public struct Balance: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Balance"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CreateTrackingAccountBalanceFragment.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
      self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var createTrackingAccountBalanceFragment: CreateTrackingAccountBalanceFragment {
        get {
          return CreateTrackingAccountBalanceFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct DeleteBudgetAccountBudgetAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment DeleteBudgetAccount_BudgetAccountFragment on BudgetAccount {
      __typename
      id
    }
    """

  public static let possibleTypes: [String] = ["BudgetAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID) {
    self.init(unsafeResultMap: ["__typename": "BudgetAccount", "id": id])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct DeleteTrackingAccountTrackingAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment DeleteTrackingAccount_TrackingAccountFragment on TrackingAccount {
      __typename
      id
    }
    """

  public static let possibleTypes: [String] = ["TrackingAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID) {
    self.init(unsafeResultMap: ["__typename": "TrackingAccount", "id": id])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct GetAccountBalanceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment GetAccount_BalanceFragment on Balance {
      __typename
      date
      currency
      cleared
      uncleared
      running
    }
    """

  public static let possibleTypes: [String] = ["Balance"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("date", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("cleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("uncleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("running", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
    self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var cleared: Int {
    get {
      return resultMap["cleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "cleared")
    }
  }

  public var uncleared: Int {
    get {
      return resultMap["uncleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "uncleared")
    }
  }

  public var running: Int {
    get {
      return resultMap["running"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "running")
    }
  }
}

public struct GetAccountAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment GetAccount_AccountFragment on Account {
      __typename
      ... on BudgetAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...GetAccount_BalanceFragment
        }
        balances(from: $balancesFromDate, to: $balancesToDate, frequency: $frequency) {
          __typename
          ...GetAccount_BalanceFragment
        }
      }
      ... on TrackingAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...GetAccount_BalanceFragment
        }
        balances(from: $balancesFromDate, to: $balancesToDate, frequency: $frequency) {
          __typename
          ...GetAccount_BalanceFragment
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["BudgetAccount", "TrackingAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLTypeCase(
        variants: ["BudgetAccount": AsBudgetAccount.selections, "TrackingAccount": AsTrackingAccount.selections],
        default: [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        ]
      )
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeBudgetAccount(id: GraphQLID, name: String? = nil, balance: AsBudgetAccount.Balance, balances: [AsBudgetAccount.Balance]) -> GetAccountAccountFragment {
    return GetAccountAccountFragment(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap, "balances": balances.map { (value: AsBudgetAccount.Balance) -> ResultMap in value.resultMap }])
  }

  public static func makeTrackingAccount(id: GraphQLID, name: String? = nil, balance: AsTrackingAccount.Balance, balances: [AsTrackingAccount.Balance]) -> GetAccountAccountFragment {
    return GetAccountAccountFragment(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap, "balances": balances.map { (value: AsTrackingAccount.Balance) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var asBudgetAccount: AsBudgetAccount? {
    get {
      if !AsBudgetAccount.possibleTypes.contains(__typename) { return nil }
      return AsBudgetAccount(unsafeResultMap: resultMap)
    }
    set {
      guard let newValue = newValue else { return }
      resultMap = newValue.resultMap
    }
  }

  public struct AsBudgetAccount: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["BudgetAccount"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
        GraphQLField("balances", arguments: ["from": GraphQLVariable("balancesFromDate"), "to": GraphQLVariable("balancesToDate"), "frequency": GraphQLVariable("frequency")], type: .nonNull(.list(.nonNull(.object(Balance.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, balance: Balance, balances: [Balance]) {
      self.init(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap, "balances": balances.map { (value: Balance) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var balance: Balance {
      get {
        return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "balance")
      }
    }

    public var balances: [Balance] {
      get {
        return (resultMap["balances"] as! [ResultMap]).map { (value: ResultMap) -> Balance in Balance(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Balance) -> ResultMap in value.resultMap }, forKey: "balances")
      }
    }

    public struct Balance: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Balance"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetAccountBalanceFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
        self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getAccountBalanceFragment: GetAccountBalanceFragment {
          get {
            return GetAccountBalanceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public var asTrackingAccount: AsTrackingAccount? {
    get {
      if !AsTrackingAccount.possibleTypes.contains(__typename) { return nil }
      return AsTrackingAccount(unsafeResultMap: resultMap)
    }
    set {
      guard let newValue = newValue else { return }
      resultMap = newValue.resultMap
    }
  }

  public struct AsTrackingAccount: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["TrackingAccount"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
        GraphQLField("balances", arguments: ["from": GraphQLVariable("balancesFromDate"), "to": GraphQLVariable("balancesToDate"), "frequency": GraphQLVariable("frequency")], type: .nonNull(.list(.nonNull(.object(Balance.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, balance: Balance, balances: [Balance]) {
      self.init(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap, "balances": balances.map { (value: Balance) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var balance: Balance {
      get {
        return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "balance")
      }
    }

    public var balances: [Balance] {
      get {
        return (resultMap["balances"] as! [ResultMap]).map { (value: ResultMap) -> Balance in Balance(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Balance) -> ResultMap in value.resultMap }, forKey: "balances")
      }
    }

    public struct Balance: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Balance"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetAccountBalanceFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
        self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getAccountBalanceFragment: GetAccountBalanceFragment {
          get {
            return GetAccountBalanceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ListAccountsBalanceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ListAccounts_BalanceFragment on Balance {
      __typename
      date
      currency
      cleared
      uncleared
      running
    }
    """

  public static let possibleTypes: [String] = ["Balance"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("date", type: .nonNull(.scalar(String.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("cleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("uncleared", type: .nonNull(.scalar(Int.self))),
      GraphQLField("running", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
    self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var cleared: Int {
    get {
      return resultMap["cleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "cleared")
    }
  }

  public var uncleared: Int {
    get {
      return resultMap["uncleared"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "uncleared")
    }
  }

  public var running: Int {
    get {
      return resultMap["running"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "running")
    }
  }
}

public struct ListAccountsAccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ListAccounts_AccountFragment on Account {
      __typename
      ... on BudgetAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...ListAccounts_BalanceFragment
        }
      }
      ... on TrackingAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...ListAccounts_BalanceFragment
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["BudgetAccount", "TrackingAccount"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLTypeCase(
        variants: ["BudgetAccount": AsBudgetAccount.selections, "TrackingAccount": AsTrackingAccount.selections],
        default: [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        ]
      )
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeBudgetAccount(id: GraphQLID, name: String? = nil, balance: AsBudgetAccount.Balance) -> ListAccountsAccountFragment {
    return ListAccountsAccountFragment(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap])
  }

  public static func makeTrackingAccount(id: GraphQLID, name: String? = nil, balance: AsTrackingAccount.Balance) -> ListAccountsAccountFragment {
    return ListAccountsAccountFragment(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var asBudgetAccount: AsBudgetAccount? {
    get {
      if !AsBudgetAccount.possibleTypes.contains(__typename) { return nil }
      return AsBudgetAccount(unsafeResultMap: resultMap)
    }
    set {
      guard let newValue = newValue else { return }
      resultMap = newValue.resultMap
    }
  }

  public struct AsBudgetAccount: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["BudgetAccount"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, balance: Balance) {
      self.init(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var balance: Balance {
      get {
        return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "balance")
      }
    }

    public struct Balance: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Balance"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ListAccountsBalanceFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
        self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var listAccountsBalanceFragment: ListAccountsBalanceFragment {
          get {
            return ListAccountsBalanceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public var asTrackingAccount: AsTrackingAccount? {
    get {
      if !AsTrackingAccount.possibleTypes.contains(__typename) { return nil }
      return AsTrackingAccount(unsafeResultMap: resultMap)
    }
    set {
      guard let newValue = newValue else { return }
      resultMap = newValue.resultMap
    }
  }

  public struct AsTrackingAccount: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["TrackingAccount"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", arguments: ["to": GraphQLVariable("balanceToDate")], type: .nonNull(.object(Balance.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, balance: Balance) {
      self.init(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var balance: Balance {
      get {
        return Balance(unsafeResultMap: resultMap["balance"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "balance")
      }
    }

    public struct Balance: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Balance"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ListAccountsBalanceFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, currency: String, cleared: Int, uncleared: Int, running: Int) {
        self.init(unsafeResultMap: ["__typename": "Balance", "date": date, "currency": currency, "cleared": cleared, "uncleared": uncleared, "running": running])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var listAccountsBalanceFragment: ListAccountsBalanceFragment {
          get {
            return ListAccountsBalanceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
