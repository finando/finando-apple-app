// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAccountQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAccount($id: ID!, $balanceToDate: DateTime!) {
      account: getAccount(id: $id) {
        __typename
        ...AccountFragment
      }
    }
    """

  public let operationName: String = "GetAccount"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AccountFragment.fragmentDefinition)
    document.append("\n" + BalanceFragment.fragmentDefinition)
    return document
  }

  public var id: GraphQLID
  public var balanceToDate: String

  public init(id: GraphQLID, balanceToDate: String) {
    self.id = id
    self.balanceToDate = balanceToDate
  }

  public var variables: GraphQLMap? {
    return ["id": id, "balanceToDate": balanceToDate]
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
          GraphQLFragmentSpread(AccountFragment.self),
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

        public var accountFragment: AccountFragment {
          get {
            return AccountFragment(unsafeResultMap: resultMap)
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
        ...AccountFragment
      }
    }
    """

  public let operationName: String = "ListAccounts"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AccountFragment.fragmentDefinition)
    document.append("\n" + BalanceFragment.fragmentDefinition)
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
          GraphQLFragmentSpread(AccountFragment.self),
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

        public var accountFragment: AccountFragment {
          get {
            return AccountFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct BalanceFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BalanceFragment on Balance {
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

public struct AccountFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AccountFragment on Account {
      __typename
      ... on BudgetAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...BalanceFragment
        }
      }
      ... on TrackingAccount {
        id
        name
        balance(to: $balanceToDate) {
          __typename
          ...BalanceFragment
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

  public static func makeBudgetAccount(id: GraphQLID, name: String? = nil, balance: AsBudgetAccount.Balance) -> AccountFragment {
    return AccountFragment(unsafeResultMap: ["__typename": "BudgetAccount", "id": id, "name": name, "balance": balance.resultMap])
  }

  public static func makeTrackingAccount(id: GraphQLID, name: String? = nil, balance: AsTrackingAccount.Balance) -> AccountFragment {
    return AccountFragment(unsafeResultMap: ["__typename": "TrackingAccount", "id": id, "name": name, "balance": balance.resultMap])
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
          GraphQLFragmentSpread(BalanceFragment.self),
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

        public var balanceFragment: BalanceFragment {
          get {
            return BalanceFragment(unsafeResultMap: resultMap)
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
          GraphQLFragmentSpread(BalanceFragment.self),
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

        public var balanceFragment: BalanceFragment {
          get {
            return BalanceFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
