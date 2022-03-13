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

public struct CreateTransactionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - createdAt
  ///   - description
  ///   - entries
  ///   - tags
  public init(createdAt: String, description: Swift.Optional<String?> = nil, entries: Swift.Optional<[CreateEntryInput]?> = nil, tags: Swift.Optional<[Tag]?> = nil) {
    graphQLMap = ["createdAt": createdAt, "description": description, "entries": entries, "tags": tags]
  }

  public var createdAt: String {
    get {
      return graphQLMap["createdAt"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var entries: Swift.Optional<[CreateEntryInput]?> {
    get {
      return graphQLMap["entries"] as? Swift.Optional<[CreateEntryInput]?> ?? Swift.Optional<[CreateEntryInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "entries")
    }
  }

  public var tags: Swift.Optional<[Tag]?> {
    get {
      return graphQLMap["tags"] as? Swift.Optional<[Tag]?> ?? Swift.Optional<[Tag]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tags")
    }
  }
}

public struct CreateEntryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - account
  ///   - credit
  ///   - currency
  ///   - debit
  public init(account: GraphQLID, credit: String, currency: String, debit: String) {
    graphQLMap = ["account": account, "credit": credit, "currency": currency, "debit": debit]
  }

  public var account: GraphQLID {
    get {
      return graphQLMap["account"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "account")
    }
  }

  public var credit: String {
    get {
      return graphQLMap["credit"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit")
    }
  }

  public var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var debit: String {
    get {
      return graphQLMap["debit"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "debit")
    }
  }
}

public enum Tag: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case expense
  case expenseDebt
  case expenseDebtCarPayment
  case expenseDebtCreditCard
  case expenseDebtMiscellaneous
  case expenseDebtStudentLoan
  case expenseEntertainment
  case expenseEntertainmentClub
  case expenseEntertainmentConcert
  case expenseEntertainmentDrinks
  case expenseEntertainmentGame
  case expenseEntertainmentMiscellaneous
  case expenseEntertainmentMovie
  case expenseEntertainmentSubscription
  case expenseEntertainmentVacation
  case expenseFood
  case expenseFoodAlcohol
  case expenseFoodCanteen
  case expenseFoodCoffee
  case expenseFoodDelivery
  case expenseFoodFastFood
  case expenseFoodGroceries
  case expenseFoodMiscellaneous
  case expenseFoodRestaurant
  case expenseHealthCare
  case expenseHealthCareDental
  case expenseHealthCareMedicalDevices
  case expenseHealthCareMedications
  case expenseHealthCarePrimary
  case expenseHealthCareSpecialty
  case expenseHealthCareUrgent
  case expenseHousing
  case expenseHousingAppliances
  case expenseHousingDeposit
  case expenseHousingHoaFee
  case expenseHousingHotel
  case expenseHousingMortgage
  case expenseHousingRent
  case expenseHousingRepair
  case expenseHousingTax
  case expenseInsurance
  case expenseInsuranceCar
  case expenseInsuranceDental
  case expenseInsuranceHealth
  case expenseInsuranceHomeownerInsurance
  case expenseInsuranceLife
  case expenseInsuranceRenterInsurance
  case expenseInsuranceTravel
  case expenseMiscellaneous
  case expenseMiscellaneousBankFee
  case expenseMiscellaneousCreditCardFee
  case expenseMiscellaneousTax
  case expensePersonalCare
  case expensePersonalCareClothing
  case expensePersonalCareFoodSupplements
  case expensePersonalCareGymMembership
  case expensePersonalCareHaircut
  case expensePersonalCareShoes
  case expensePersonalCareToiletries
  case expenseShopping
  case expenseShoppingBooks
  case expenseShoppingEducation
  case expenseShoppingElectronics
  case expenseShoppingFurniture
  case expenseShoppingHobbies
  case expenseShoppingMiscellaneous
  case expenseShoppingSoftware
  case expenseShoppingSports
  case expenseTransportation
  case expenseTransportationFee
  case expenseTransportationFuel
  case expenseTransportationMaintenance
  case expenseTransportationParking
  case expenseTransportationPlaneTickets
  case expenseTransportationPublic
  case expenseTransportationTaxi
  case expenseTransportationToll
  case expenseUtilities
  case expenseUtilitiesCable
  case expenseUtilitiesCellPhone
  case expenseUtilitiesElectricity
  case expenseUtilitiesInternet
  case expenseUtilitiesTrash
  case expenseUtilitiesWater
  case income
  case incomeBonus
  case incomeInterest
  case incomeInvestments
  case incomeMiscellaneous
  case incomePaycheck
  case incomeReimbursement
  case incomeRental
  case incomeTaxReturn
  case incomeTransfer
  case transfer
  case transferInvestments
  case transferSavings
  case transferSavingsBsu
  case transferSavingsEmergency
  case transferSavingsFutureExpenses
  case transferSavingsRetirement
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "EXPENSE": self = .expense
      case "EXPENSE_DEBT": self = .expenseDebt
      case "EXPENSE_DEBT_CAR_PAYMENT": self = .expenseDebtCarPayment
      case "EXPENSE_DEBT_CREDIT_CARD": self = .expenseDebtCreditCard
      case "EXPENSE_DEBT_MISCELLANEOUS": self = .expenseDebtMiscellaneous
      case "EXPENSE_DEBT_STUDENT_LOAN": self = .expenseDebtStudentLoan
      case "EXPENSE_ENTERTAINMENT": self = .expenseEntertainment
      case "EXPENSE_ENTERTAINMENT_CLUB": self = .expenseEntertainmentClub
      case "EXPENSE_ENTERTAINMENT_CONCERT": self = .expenseEntertainmentConcert
      case "EXPENSE_ENTERTAINMENT_DRINKS": self = .expenseEntertainmentDrinks
      case "EXPENSE_ENTERTAINMENT_GAME": self = .expenseEntertainmentGame
      case "EXPENSE_ENTERTAINMENT_MISCELLANEOUS": self = .expenseEntertainmentMiscellaneous
      case "EXPENSE_ENTERTAINMENT_MOVIE": self = .expenseEntertainmentMovie
      case "EXPENSE_ENTERTAINMENT_SUBSCRIPTION": self = .expenseEntertainmentSubscription
      case "EXPENSE_ENTERTAINMENT_VACATION": self = .expenseEntertainmentVacation
      case "EXPENSE_FOOD": self = .expenseFood
      case "EXPENSE_FOOD_ALCOHOL": self = .expenseFoodAlcohol
      case "EXPENSE_FOOD_CANTEEN": self = .expenseFoodCanteen
      case "EXPENSE_FOOD_COFFEE": self = .expenseFoodCoffee
      case "EXPENSE_FOOD_DELIVERY": self = .expenseFoodDelivery
      case "EXPENSE_FOOD_FAST_FOOD": self = .expenseFoodFastFood
      case "EXPENSE_FOOD_GROCERIES": self = .expenseFoodGroceries
      case "EXPENSE_FOOD_MISCELLANEOUS": self = .expenseFoodMiscellaneous
      case "EXPENSE_FOOD_RESTAURANT": self = .expenseFoodRestaurant
      case "EXPENSE_HEALTH_CARE": self = .expenseHealthCare
      case "EXPENSE_HEALTH_CARE_DENTAL": self = .expenseHealthCareDental
      case "EXPENSE_HEALTH_CARE_MEDICAL_DEVICES": self = .expenseHealthCareMedicalDevices
      case "EXPENSE_HEALTH_CARE_MEDICATIONS": self = .expenseHealthCareMedications
      case "EXPENSE_HEALTH_CARE_PRIMARY": self = .expenseHealthCarePrimary
      case "EXPENSE_HEALTH_CARE_SPECIALTY": self = .expenseHealthCareSpecialty
      case "EXPENSE_HEALTH_CARE_URGENT": self = .expenseHealthCareUrgent
      case "EXPENSE_HOUSING": self = .expenseHousing
      case "EXPENSE_HOUSING_APPLIANCES": self = .expenseHousingAppliances
      case "EXPENSE_HOUSING_DEPOSIT": self = .expenseHousingDeposit
      case "EXPENSE_HOUSING_HOA_FEE": self = .expenseHousingHoaFee
      case "EXPENSE_HOUSING_HOTEL": self = .expenseHousingHotel
      case "EXPENSE_HOUSING_MORTGAGE": self = .expenseHousingMortgage
      case "EXPENSE_HOUSING_RENT": self = .expenseHousingRent
      case "EXPENSE_HOUSING_REPAIR": self = .expenseHousingRepair
      case "EXPENSE_HOUSING_TAX": self = .expenseHousingTax
      case "EXPENSE_INSURANCE": self = .expenseInsurance
      case "EXPENSE_INSURANCE_CAR": self = .expenseInsuranceCar
      case "EXPENSE_INSURANCE_DENTAL": self = .expenseInsuranceDental
      case "EXPENSE_INSURANCE_HEALTH": self = .expenseInsuranceHealth
      case "EXPENSE_INSURANCE_HOMEOWNER_INSURANCE": self = .expenseInsuranceHomeownerInsurance
      case "EXPENSE_INSURANCE_LIFE": self = .expenseInsuranceLife
      case "EXPENSE_INSURANCE_RENTER_INSURANCE": self = .expenseInsuranceRenterInsurance
      case "EXPENSE_INSURANCE_TRAVEL": self = .expenseInsuranceTravel
      case "EXPENSE_MISCELLANEOUS": self = .expenseMiscellaneous
      case "EXPENSE_MISCELLANEOUS_BANK_FEE": self = .expenseMiscellaneousBankFee
      case "EXPENSE_MISCELLANEOUS_CREDIT_CARD_FEE": self = .expenseMiscellaneousCreditCardFee
      case "EXPENSE_MISCELLANEOUS_TAX": self = .expenseMiscellaneousTax
      case "EXPENSE_PERSONAL_CARE": self = .expensePersonalCare
      case "EXPENSE_PERSONAL_CARE_CLOTHING": self = .expensePersonalCareClothing
      case "EXPENSE_PERSONAL_CARE_FOOD_SUPPLEMENTS": self = .expensePersonalCareFoodSupplements
      case "EXPENSE_PERSONAL_CARE_GYM_MEMBERSHIP": self = .expensePersonalCareGymMembership
      case "EXPENSE_PERSONAL_CARE_HAIRCUT": self = .expensePersonalCareHaircut
      case "EXPENSE_PERSONAL_CARE_SHOES": self = .expensePersonalCareShoes
      case "EXPENSE_PERSONAL_CARE_TOILETRIES": self = .expensePersonalCareToiletries
      case "EXPENSE_SHOPPING": self = .expenseShopping
      case "EXPENSE_SHOPPING_BOOKS": self = .expenseShoppingBooks
      case "EXPENSE_SHOPPING_EDUCATION": self = .expenseShoppingEducation
      case "EXPENSE_SHOPPING_ELECTRONICS": self = .expenseShoppingElectronics
      case "EXPENSE_SHOPPING_FURNITURE": self = .expenseShoppingFurniture
      case "EXPENSE_SHOPPING_HOBBIES": self = .expenseShoppingHobbies
      case "EXPENSE_SHOPPING_MISCELLANEOUS": self = .expenseShoppingMiscellaneous
      case "EXPENSE_SHOPPING_SOFTWARE": self = .expenseShoppingSoftware
      case "EXPENSE_SHOPPING_SPORTS": self = .expenseShoppingSports
      case "EXPENSE_TRANSPORTATION": self = .expenseTransportation
      case "EXPENSE_TRANSPORTATION_FEE": self = .expenseTransportationFee
      case "EXPENSE_TRANSPORTATION_FUEL": self = .expenseTransportationFuel
      case "EXPENSE_TRANSPORTATION_MAINTENANCE": self = .expenseTransportationMaintenance
      case "EXPENSE_TRANSPORTATION_PARKING": self = .expenseTransportationParking
      case "EXPENSE_TRANSPORTATION_PLANE_TICKETS": self = .expenseTransportationPlaneTickets
      case "EXPENSE_TRANSPORTATION_PUBLIC": self = .expenseTransportationPublic
      case "EXPENSE_TRANSPORTATION_TAXI": self = .expenseTransportationTaxi
      case "EXPENSE_TRANSPORTATION_TOLL": self = .expenseTransportationToll
      case "EXPENSE_UTILITIES": self = .expenseUtilities
      case "EXPENSE_UTILITIES_CABLE": self = .expenseUtilitiesCable
      case "EXPENSE_UTILITIES_CELL_PHONE": self = .expenseUtilitiesCellPhone
      case "EXPENSE_UTILITIES_ELECTRICITY": self = .expenseUtilitiesElectricity
      case "EXPENSE_UTILITIES_INTERNET": self = .expenseUtilitiesInternet
      case "EXPENSE_UTILITIES_TRASH": self = .expenseUtilitiesTrash
      case "EXPENSE_UTILITIES_WATER": self = .expenseUtilitiesWater
      case "INCOME": self = .income
      case "INCOME_BONUS": self = .incomeBonus
      case "INCOME_INTEREST": self = .incomeInterest
      case "INCOME_INVESTMENTS": self = .incomeInvestments
      case "INCOME_MISCELLANEOUS": self = .incomeMiscellaneous
      case "INCOME_PAYCHECK": self = .incomePaycheck
      case "INCOME_REIMBURSEMENT": self = .incomeReimbursement
      case "INCOME_RENTAL": self = .incomeRental
      case "INCOME_TAX_RETURN": self = .incomeTaxReturn
      case "INCOME_TRANSFER": self = .incomeTransfer
      case "TRANSFER": self = .transfer
      case "TRANSFER_INVESTMENTS": self = .transferInvestments
      case "TRANSFER_SAVINGS": self = .transferSavings
      case "TRANSFER_SAVINGS_BSU": self = .transferSavingsBsu
      case "TRANSFER_SAVINGS_EMERGENCY": self = .transferSavingsEmergency
      case "TRANSFER_SAVINGS_FUTURE_EXPENSES": self = .transferSavingsFutureExpenses
      case "TRANSFER_SAVINGS_RETIREMENT": self = .transferSavingsRetirement
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .expense: return "EXPENSE"
      case .expenseDebt: return "EXPENSE_DEBT"
      case .expenseDebtCarPayment: return "EXPENSE_DEBT_CAR_PAYMENT"
      case .expenseDebtCreditCard: return "EXPENSE_DEBT_CREDIT_CARD"
      case .expenseDebtMiscellaneous: return "EXPENSE_DEBT_MISCELLANEOUS"
      case .expenseDebtStudentLoan: return "EXPENSE_DEBT_STUDENT_LOAN"
      case .expenseEntertainment: return "EXPENSE_ENTERTAINMENT"
      case .expenseEntertainmentClub: return "EXPENSE_ENTERTAINMENT_CLUB"
      case .expenseEntertainmentConcert: return "EXPENSE_ENTERTAINMENT_CONCERT"
      case .expenseEntertainmentDrinks: return "EXPENSE_ENTERTAINMENT_DRINKS"
      case .expenseEntertainmentGame: return "EXPENSE_ENTERTAINMENT_GAME"
      case .expenseEntertainmentMiscellaneous: return "EXPENSE_ENTERTAINMENT_MISCELLANEOUS"
      case .expenseEntertainmentMovie: return "EXPENSE_ENTERTAINMENT_MOVIE"
      case .expenseEntertainmentSubscription: return "EXPENSE_ENTERTAINMENT_SUBSCRIPTION"
      case .expenseEntertainmentVacation: return "EXPENSE_ENTERTAINMENT_VACATION"
      case .expenseFood: return "EXPENSE_FOOD"
      case .expenseFoodAlcohol: return "EXPENSE_FOOD_ALCOHOL"
      case .expenseFoodCanteen: return "EXPENSE_FOOD_CANTEEN"
      case .expenseFoodCoffee: return "EXPENSE_FOOD_COFFEE"
      case .expenseFoodDelivery: return "EXPENSE_FOOD_DELIVERY"
      case .expenseFoodFastFood: return "EXPENSE_FOOD_FAST_FOOD"
      case .expenseFoodGroceries: return "EXPENSE_FOOD_GROCERIES"
      case .expenseFoodMiscellaneous: return "EXPENSE_FOOD_MISCELLANEOUS"
      case .expenseFoodRestaurant: return "EXPENSE_FOOD_RESTAURANT"
      case .expenseHealthCare: return "EXPENSE_HEALTH_CARE"
      case .expenseHealthCareDental: return "EXPENSE_HEALTH_CARE_DENTAL"
      case .expenseHealthCareMedicalDevices: return "EXPENSE_HEALTH_CARE_MEDICAL_DEVICES"
      case .expenseHealthCareMedications: return "EXPENSE_HEALTH_CARE_MEDICATIONS"
      case .expenseHealthCarePrimary: return "EXPENSE_HEALTH_CARE_PRIMARY"
      case .expenseHealthCareSpecialty: return "EXPENSE_HEALTH_CARE_SPECIALTY"
      case .expenseHealthCareUrgent: return "EXPENSE_HEALTH_CARE_URGENT"
      case .expenseHousing: return "EXPENSE_HOUSING"
      case .expenseHousingAppliances: return "EXPENSE_HOUSING_APPLIANCES"
      case .expenseHousingDeposit: return "EXPENSE_HOUSING_DEPOSIT"
      case .expenseHousingHoaFee: return "EXPENSE_HOUSING_HOA_FEE"
      case .expenseHousingHotel: return "EXPENSE_HOUSING_HOTEL"
      case .expenseHousingMortgage: return "EXPENSE_HOUSING_MORTGAGE"
      case .expenseHousingRent: return "EXPENSE_HOUSING_RENT"
      case .expenseHousingRepair: return "EXPENSE_HOUSING_REPAIR"
      case .expenseHousingTax: return "EXPENSE_HOUSING_TAX"
      case .expenseInsurance: return "EXPENSE_INSURANCE"
      case .expenseInsuranceCar: return "EXPENSE_INSURANCE_CAR"
      case .expenseInsuranceDental: return "EXPENSE_INSURANCE_DENTAL"
      case .expenseInsuranceHealth: return "EXPENSE_INSURANCE_HEALTH"
      case .expenseInsuranceHomeownerInsurance: return "EXPENSE_INSURANCE_HOMEOWNER_INSURANCE"
      case .expenseInsuranceLife: return "EXPENSE_INSURANCE_LIFE"
      case .expenseInsuranceRenterInsurance: return "EXPENSE_INSURANCE_RENTER_INSURANCE"
      case .expenseInsuranceTravel: return "EXPENSE_INSURANCE_TRAVEL"
      case .expenseMiscellaneous: return "EXPENSE_MISCELLANEOUS"
      case .expenseMiscellaneousBankFee: return "EXPENSE_MISCELLANEOUS_BANK_FEE"
      case .expenseMiscellaneousCreditCardFee: return "EXPENSE_MISCELLANEOUS_CREDIT_CARD_FEE"
      case .expenseMiscellaneousTax: return "EXPENSE_MISCELLANEOUS_TAX"
      case .expensePersonalCare: return "EXPENSE_PERSONAL_CARE"
      case .expensePersonalCareClothing: return "EXPENSE_PERSONAL_CARE_CLOTHING"
      case .expensePersonalCareFoodSupplements: return "EXPENSE_PERSONAL_CARE_FOOD_SUPPLEMENTS"
      case .expensePersonalCareGymMembership: return "EXPENSE_PERSONAL_CARE_GYM_MEMBERSHIP"
      case .expensePersonalCareHaircut: return "EXPENSE_PERSONAL_CARE_HAIRCUT"
      case .expensePersonalCareShoes: return "EXPENSE_PERSONAL_CARE_SHOES"
      case .expensePersonalCareToiletries: return "EXPENSE_PERSONAL_CARE_TOILETRIES"
      case .expenseShopping: return "EXPENSE_SHOPPING"
      case .expenseShoppingBooks: return "EXPENSE_SHOPPING_BOOKS"
      case .expenseShoppingEducation: return "EXPENSE_SHOPPING_EDUCATION"
      case .expenseShoppingElectronics: return "EXPENSE_SHOPPING_ELECTRONICS"
      case .expenseShoppingFurniture: return "EXPENSE_SHOPPING_FURNITURE"
      case .expenseShoppingHobbies: return "EXPENSE_SHOPPING_HOBBIES"
      case .expenseShoppingMiscellaneous: return "EXPENSE_SHOPPING_MISCELLANEOUS"
      case .expenseShoppingSoftware: return "EXPENSE_SHOPPING_SOFTWARE"
      case .expenseShoppingSports: return "EXPENSE_SHOPPING_SPORTS"
      case .expenseTransportation: return "EXPENSE_TRANSPORTATION"
      case .expenseTransportationFee: return "EXPENSE_TRANSPORTATION_FEE"
      case .expenseTransportationFuel: return "EXPENSE_TRANSPORTATION_FUEL"
      case .expenseTransportationMaintenance: return "EXPENSE_TRANSPORTATION_MAINTENANCE"
      case .expenseTransportationParking: return "EXPENSE_TRANSPORTATION_PARKING"
      case .expenseTransportationPlaneTickets: return "EXPENSE_TRANSPORTATION_PLANE_TICKETS"
      case .expenseTransportationPublic: return "EXPENSE_TRANSPORTATION_PUBLIC"
      case .expenseTransportationTaxi: return "EXPENSE_TRANSPORTATION_TAXI"
      case .expenseTransportationToll: return "EXPENSE_TRANSPORTATION_TOLL"
      case .expenseUtilities: return "EXPENSE_UTILITIES"
      case .expenseUtilitiesCable: return "EXPENSE_UTILITIES_CABLE"
      case .expenseUtilitiesCellPhone: return "EXPENSE_UTILITIES_CELL_PHONE"
      case .expenseUtilitiesElectricity: return "EXPENSE_UTILITIES_ELECTRICITY"
      case .expenseUtilitiesInternet: return "EXPENSE_UTILITIES_INTERNET"
      case .expenseUtilitiesTrash: return "EXPENSE_UTILITIES_TRASH"
      case .expenseUtilitiesWater: return "EXPENSE_UTILITIES_WATER"
      case .income: return "INCOME"
      case .incomeBonus: return "INCOME_BONUS"
      case .incomeInterest: return "INCOME_INTEREST"
      case .incomeInvestments: return "INCOME_INVESTMENTS"
      case .incomeMiscellaneous: return "INCOME_MISCELLANEOUS"
      case .incomePaycheck: return "INCOME_PAYCHECK"
      case .incomeReimbursement: return "INCOME_REIMBURSEMENT"
      case .incomeRental: return "INCOME_RENTAL"
      case .incomeTaxReturn: return "INCOME_TAX_RETURN"
      case .incomeTransfer: return "INCOME_TRANSFER"
      case .transfer: return "TRANSFER"
      case .transferInvestments: return "TRANSFER_INVESTMENTS"
      case .transferSavings: return "TRANSFER_SAVINGS"
      case .transferSavingsBsu: return "TRANSFER_SAVINGS_BSU"
      case .transferSavingsEmergency: return "TRANSFER_SAVINGS_EMERGENCY"
      case .transferSavingsFutureExpenses: return "TRANSFER_SAVINGS_FUTURE_EXPENSES"
      case .transferSavingsRetirement: return "TRANSFER_SAVINGS_RETIREMENT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Tag, rhs: Tag) -> Bool {
    switch (lhs, rhs) {
      case (.expense, .expense): return true
      case (.expenseDebt, .expenseDebt): return true
      case (.expenseDebtCarPayment, .expenseDebtCarPayment): return true
      case (.expenseDebtCreditCard, .expenseDebtCreditCard): return true
      case (.expenseDebtMiscellaneous, .expenseDebtMiscellaneous): return true
      case (.expenseDebtStudentLoan, .expenseDebtStudentLoan): return true
      case (.expenseEntertainment, .expenseEntertainment): return true
      case (.expenseEntertainmentClub, .expenseEntertainmentClub): return true
      case (.expenseEntertainmentConcert, .expenseEntertainmentConcert): return true
      case (.expenseEntertainmentDrinks, .expenseEntertainmentDrinks): return true
      case (.expenseEntertainmentGame, .expenseEntertainmentGame): return true
      case (.expenseEntertainmentMiscellaneous, .expenseEntertainmentMiscellaneous): return true
      case (.expenseEntertainmentMovie, .expenseEntertainmentMovie): return true
      case (.expenseEntertainmentSubscription, .expenseEntertainmentSubscription): return true
      case (.expenseEntertainmentVacation, .expenseEntertainmentVacation): return true
      case (.expenseFood, .expenseFood): return true
      case (.expenseFoodAlcohol, .expenseFoodAlcohol): return true
      case (.expenseFoodCanteen, .expenseFoodCanteen): return true
      case (.expenseFoodCoffee, .expenseFoodCoffee): return true
      case (.expenseFoodDelivery, .expenseFoodDelivery): return true
      case (.expenseFoodFastFood, .expenseFoodFastFood): return true
      case (.expenseFoodGroceries, .expenseFoodGroceries): return true
      case (.expenseFoodMiscellaneous, .expenseFoodMiscellaneous): return true
      case (.expenseFoodRestaurant, .expenseFoodRestaurant): return true
      case (.expenseHealthCare, .expenseHealthCare): return true
      case (.expenseHealthCareDental, .expenseHealthCareDental): return true
      case (.expenseHealthCareMedicalDevices, .expenseHealthCareMedicalDevices): return true
      case (.expenseHealthCareMedications, .expenseHealthCareMedications): return true
      case (.expenseHealthCarePrimary, .expenseHealthCarePrimary): return true
      case (.expenseHealthCareSpecialty, .expenseHealthCareSpecialty): return true
      case (.expenseHealthCareUrgent, .expenseHealthCareUrgent): return true
      case (.expenseHousing, .expenseHousing): return true
      case (.expenseHousingAppliances, .expenseHousingAppliances): return true
      case (.expenseHousingDeposit, .expenseHousingDeposit): return true
      case (.expenseHousingHoaFee, .expenseHousingHoaFee): return true
      case (.expenseHousingHotel, .expenseHousingHotel): return true
      case (.expenseHousingMortgage, .expenseHousingMortgage): return true
      case (.expenseHousingRent, .expenseHousingRent): return true
      case (.expenseHousingRepair, .expenseHousingRepair): return true
      case (.expenseHousingTax, .expenseHousingTax): return true
      case (.expenseInsurance, .expenseInsurance): return true
      case (.expenseInsuranceCar, .expenseInsuranceCar): return true
      case (.expenseInsuranceDental, .expenseInsuranceDental): return true
      case (.expenseInsuranceHealth, .expenseInsuranceHealth): return true
      case (.expenseInsuranceHomeownerInsurance, .expenseInsuranceHomeownerInsurance): return true
      case (.expenseInsuranceLife, .expenseInsuranceLife): return true
      case (.expenseInsuranceRenterInsurance, .expenseInsuranceRenterInsurance): return true
      case (.expenseInsuranceTravel, .expenseInsuranceTravel): return true
      case (.expenseMiscellaneous, .expenseMiscellaneous): return true
      case (.expenseMiscellaneousBankFee, .expenseMiscellaneousBankFee): return true
      case (.expenseMiscellaneousCreditCardFee, .expenseMiscellaneousCreditCardFee): return true
      case (.expenseMiscellaneousTax, .expenseMiscellaneousTax): return true
      case (.expensePersonalCare, .expensePersonalCare): return true
      case (.expensePersonalCareClothing, .expensePersonalCareClothing): return true
      case (.expensePersonalCareFoodSupplements, .expensePersonalCareFoodSupplements): return true
      case (.expensePersonalCareGymMembership, .expensePersonalCareGymMembership): return true
      case (.expensePersonalCareHaircut, .expensePersonalCareHaircut): return true
      case (.expensePersonalCareShoes, .expensePersonalCareShoes): return true
      case (.expensePersonalCareToiletries, .expensePersonalCareToiletries): return true
      case (.expenseShopping, .expenseShopping): return true
      case (.expenseShoppingBooks, .expenseShoppingBooks): return true
      case (.expenseShoppingEducation, .expenseShoppingEducation): return true
      case (.expenseShoppingElectronics, .expenseShoppingElectronics): return true
      case (.expenseShoppingFurniture, .expenseShoppingFurniture): return true
      case (.expenseShoppingHobbies, .expenseShoppingHobbies): return true
      case (.expenseShoppingMiscellaneous, .expenseShoppingMiscellaneous): return true
      case (.expenseShoppingSoftware, .expenseShoppingSoftware): return true
      case (.expenseShoppingSports, .expenseShoppingSports): return true
      case (.expenseTransportation, .expenseTransportation): return true
      case (.expenseTransportationFee, .expenseTransportationFee): return true
      case (.expenseTransportationFuel, .expenseTransportationFuel): return true
      case (.expenseTransportationMaintenance, .expenseTransportationMaintenance): return true
      case (.expenseTransportationParking, .expenseTransportationParking): return true
      case (.expenseTransportationPlaneTickets, .expenseTransportationPlaneTickets): return true
      case (.expenseTransportationPublic, .expenseTransportationPublic): return true
      case (.expenseTransportationTaxi, .expenseTransportationTaxi): return true
      case (.expenseTransportationToll, .expenseTransportationToll): return true
      case (.expenseUtilities, .expenseUtilities): return true
      case (.expenseUtilitiesCable, .expenseUtilitiesCable): return true
      case (.expenseUtilitiesCellPhone, .expenseUtilitiesCellPhone): return true
      case (.expenseUtilitiesElectricity, .expenseUtilitiesElectricity): return true
      case (.expenseUtilitiesInternet, .expenseUtilitiesInternet): return true
      case (.expenseUtilitiesTrash, .expenseUtilitiesTrash): return true
      case (.expenseUtilitiesWater, .expenseUtilitiesWater): return true
      case (.income, .income): return true
      case (.incomeBonus, .incomeBonus): return true
      case (.incomeInterest, .incomeInterest): return true
      case (.incomeInvestments, .incomeInvestments): return true
      case (.incomeMiscellaneous, .incomeMiscellaneous): return true
      case (.incomePaycheck, .incomePaycheck): return true
      case (.incomeReimbursement, .incomeReimbursement): return true
      case (.incomeRental, .incomeRental): return true
      case (.incomeTaxReturn, .incomeTaxReturn): return true
      case (.incomeTransfer, .incomeTransfer): return true
      case (.transfer, .transfer): return true
      case (.transferInvestments, .transferInvestments): return true
      case (.transferSavings, .transferSavings): return true
      case (.transferSavingsBsu, .transferSavingsBsu): return true
      case (.transferSavingsEmergency, .transferSavingsEmergency): return true
      case (.transferSavingsFutureExpenses, .transferSavingsFutureExpenses): return true
      case (.transferSavingsRetirement, .transferSavingsRetirement): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Tag] {
    return [
      .expense,
      .expenseDebt,
      .expenseDebtCarPayment,
      .expenseDebtCreditCard,
      .expenseDebtMiscellaneous,
      .expenseDebtStudentLoan,
      .expenseEntertainment,
      .expenseEntertainmentClub,
      .expenseEntertainmentConcert,
      .expenseEntertainmentDrinks,
      .expenseEntertainmentGame,
      .expenseEntertainmentMiscellaneous,
      .expenseEntertainmentMovie,
      .expenseEntertainmentSubscription,
      .expenseEntertainmentVacation,
      .expenseFood,
      .expenseFoodAlcohol,
      .expenseFoodCanteen,
      .expenseFoodCoffee,
      .expenseFoodDelivery,
      .expenseFoodFastFood,
      .expenseFoodGroceries,
      .expenseFoodMiscellaneous,
      .expenseFoodRestaurant,
      .expenseHealthCare,
      .expenseHealthCareDental,
      .expenseHealthCareMedicalDevices,
      .expenseHealthCareMedications,
      .expenseHealthCarePrimary,
      .expenseHealthCareSpecialty,
      .expenseHealthCareUrgent,
      .expenseHousing,
      .expenseHousingAppliances,
      .expenseHousingDeposit,
      .expenseHousingHoaFee,
      .expenseHousingHotel,
      .expenseHousingMortgage,
      .expenseHousingRent,
      .expenseHousingRepair,
      .expenseHousingTax,
      .expenseInsurance,
      .expenseInsuranceCar,
      .expenseInsuranceDental,
      .expenseInsuranceHealth,
      .expenseInsuranceHomeownerInsurance,
      .expenseInsuranceLife,
      .expenseInsuranceRenterInsurance,
      .expenseInsuranceTravel,
      .expenseMiscellaneous,
      .expenseMiscellaneousBankFee,
      .expenseMiscellaneousCreditCardFee,
      .expenseMiscellaneousTax,
      .expensePersonalCare,
      .expensePersonalCareClothing,
      .expensePersonalCareFoodSupplements,
      .expensePersonalCareGymMembership,
      .expensePersonalCareHaircut,
      .expensePersonalCareShoes,
      .expensePersonalCareToiletries,
      .expenseShopping,
      .expenseShoppingBooks,
      .expenseShoppingEducation,
      .expenseShoppingElectronics,
      .expenseShoppingFurniture,
      .expenseShoppingHobbies,
      .expenseShoppingMiscellaneous,
      .expenseShoppingSoftware,
      .expenseShoppingSports,
      .expenseTransportation,
      .expenseTransportationFee,
      .expenseTransportationFuel,
      .expenseTransportationMaintenance,
      .expenseTransportationParking,
      .expenseTransportationPlaneTickets,
      .expenseTransportationPublic,
      .expenseTransportationTaxi,
      .expenseTransportationToll,
      .expenseUtilities,
      .expenseUtilitiesCable,
      .expenseUtilitiesCellPhone,
      .expenseUtilitiesElectricity,
      .expenseUtilitiesInternet,
      .expenseUtilitiesTrash,
      .expenseUtilitiesWater,
      .income,
      .incomeBonus,
      .incomeInterest,
      .incomeInvestments,
      .incomeMiscellaneous,
      .incomePaycheck,
      .incomeReimbursement,
      .incomeRental,
      .incomeTaxReturn,
      .incomeTransfer,
      .transfer,
      .transferInvestments,
      .transferSavings,
      .transferSavingsBsu,
      .transferSavingsEmergency,
      .transferSavingsFutureExpenses,
      .transferSavingsRetirement,
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

public struct PaginationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - cursor
  ///   - take
  public init(cursor: Swift.Optional<String?> = nil, take: Swift.Optional<Int?> = nil) {
    graphQLMap = ["cursor": cursor, "take": take]
  }

  public var cursor: Swift.Optional<String?> {
    get {
      return graphQLMap["cursor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cursor")
    }
  }

  public var take: Swift.Optional<Int?> {
    get {
      return graphQLMap["take"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "take")
    }
  }
}

public enum TransactionStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case cleared
  case reconciled
  case uncleared
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CLEARED": self = .cleared
      case "RECONCILED": self = .reconciled
      case "UNCLEARED": self = .uncleared
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .cleared: return "CLEARED"
      case .reconciled: return "RECONCILED"
      case .uncleared: return "UNCLEARED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionStatus, rhs: TransactionStatus) -> Bool {
    switch (lhs, rhs) {
      case (.cleared, .cleared): return true
      case (.reconciled, .reconciled): return true
      case (.uncleared, .uncleared): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionStatus] {
    return [
      .cleared,
      .reconciled,
      .uncleared,
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

public final class CreateTransactionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateTransaction($data: CreateTransactionInput!) {
      transaction: createTransaction(data: $data) {
        __typename
        ...CreateTransaction_TransactionFragment
      }
    }
    """

  public let operationName: String = "CreateTransaction"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CreateTransactionTransactionFragment.fragmentDefinition)
    return document
  }

  public var data: CreateTransactionInput

  public init(data: CreateTransactionInput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createTransaction", alias: "transaction", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(Transaction.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transaction: Transaction) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "transaction": transaction.resultMap])
    }

    public var transaction: Transaction {
      get {
        return Transaction(unsafeResultMap: resultMap["transaction"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "transaction")
      }
    }

    public struct Transaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Transaction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CreateTransactionTransactionFragment.self),
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

        public var createTransactionTransactionFragment: CreateTransactionTransactionFragment {
          get {
            return CreateTransactionTransactionFragment(unsafeResultMap: resultMap)
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

public final class DeleteTransactionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteTransaction($id: ID!) {
      transaction: deleteTransaction(id: $id) {
        __typename
        ...DeleteTransaction_TransactionFragment
      }
    }
    """

  public let operationName: String = "DeleteTransaction"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeleteTransactionTransactionFragment.fragmentDefinition)
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
        GraphQLField("deleteTransaction", alias: "transaction", arguments: ["id": GraphQLVariable("id")], type: .object(Transaction.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transaction: Transaction? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "transaction": transaction.flatMap { (value: Transaction) -> ResultMap in value.resultMap }])
    }

    public var transaction: Transaction? {
      get {
        return (resultMap["transaction"] as? ResultMap).flatMap { Transaction(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "transaction")
      }
    }

    public struct Transaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Transaction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeleteTransactionTransactionFragment.self),
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

        public var deleteTransactionTransactionFragment: DeleteTransactionTransactionFragment {
          get {
            return DeleteTransactionTransactionFragment(unsafeResultMap: resultMap)
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

public final class ListLatestTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListLatestTransactions($accountId: ID, $paginationInput: PaginationInput) {
      transactions: listLatestTransactions(
        accountId: $accountId
        paginationInput: $paginationInput
      ) {
        __typename
        data {
          __typename
          ...ListLatestTransactions_TransactionFragment
        }
        has_more
      }
    }
    """

  public let operationName: String = "ListLatestTransactions"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ListLatestTransactionsTransactionFragment.fragmentDefinition)
    return document
  }

  public var accountId: GraphQLID?
  public var paginationInput: PaginationInput?

  public init(accountId: GraphQLID? = nil, paginationInput: PaginationInput? = nil) {
    self.accountId = accountId
    self.paginationInput = paginationInput
  }

  public var variables: GraphQLMap? {
    return ["accountId": accountId, "paginationInput": paginationInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listLatestTransactions", alias: "transactions", arguments: ["accountId": GraphQLVariable("accountId"), "paginationInput": GraphQLVariable("paginationInput")], type: .nonNull(.object(Transaction.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transactions: Transaction) {
      self.init(unsafeResultMap: ["__typename": "Query", "transactions": transactions.resultMap])
    }

    public var transactions: Transaction {
      get {
        return Transaction(unsafeResultMap: resultMap["transactions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "transactions")
      }
    }

    public struct Transaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TransactionsPagedResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          GraphQLField("has_more", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum], hasMore: Bool) {
        self.init(unsafeResultMap: ["__typename": "TransactionsPagedResult", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }, "has_more": hasMore])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public var hasMore: Bool {
        get {
          return resultMap["has_more"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "has_more")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Transaction"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ListLatestTransactionsTransactionFragment.self),
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

          public var listLatestTransactionsTransactionFragment: ListLatestTransactionsTransactionFragment {
            get {
              return ListLatestTransactionsTransactionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class ListScheduledTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListScheduledTransactions($accountId: ID!) {
      scheduledTransactions: listScheduledTransactions(accountId: $accountId) {
        __typename
        ...ListScheduledTransactions_ScheduledTransactionFragment
      }
    }
    """

  public let operationName: String = "ListScheduledTransactions"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ListScheduledTransactionsScheduledTransactionFragment.fragmentDefinition)
    return document
  }

  public var accountId: GraphQLID

  public init(accountId: GraphQLID) {
    self.accountId = accountId
  }

  public var variables: GraphQLMap? {
    return ["accountId": accountId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listScheduledTransactions", alias: "scheduledTransactions", arguments: ["accountId": GraphQLVariable("accountId")], type: .nonNull(.list(.nonNull(.object(ScheduledTransaction.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(scheduledTransactions: [ScheduledTransaction]) {
      self.init(unsafeResultMap: ["__typename": "Query", "scheduledTransactions": scheduledTransactions.map { (value: ScheduledTransaction) -> ResultMap in value.resultMap }])
    }

    public var scheduledTransactions: [ScheduledTransaction] {
      get {
        return (resultMap["scheduledTransactions"] as! [ResultMap]).map { (value: ResultMap) -> ScheduledTransaction in ScheduledTransaction(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ScheduledTransaction) -> ResultMap in value.resultMap }, forKey: "scheduledTransactions")
      }
    }

    public struct ScheduledTransaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ScheduledTransaction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ListScheduledTransactionsScheduledTransactionFragment.self),
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

        public var listScheduledTransactionsScheduledTransactionFragment: ListScheduledTransactionsScheduledTransactionFragment {
          get {
            return ListScheduledTransactionsScheduledTransactionFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ListTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListTransactions($accountId: ID!) {
      transactions: listTransactions(accountId: $accountId) {
        __typename
        ...ListTransactions_TransactionFragment
      }
    }
    """

  public let operationName: String = "ListTransactions"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ListTransactionsTransactionFragment.fragmentDefinition)
    return document
  }

  public var accountId: GraphQLID

  public init(accountId: GraphQLID) {
    self.accountId = accountId
  }

  public var variables: GraphQLMap? {
    return ["accountId": accountId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listTransactions", alias: "transactions", arguments: ["accountId": GraphQLVariable("accountId")], type: .nonNull(.list(.nonNull(.object(Transaction.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transactions: [Transaction]) {
      self.init(unsafeResultMap: ["__typename": "Query", "transactions": transactions.map { (value: Transaction) -> ResultMap in value.resultMap }])
    }

    public var transactions: [Transaction] {
      get {
        return (resultMap["transactions"] as! [ResultMap]).map { (value: ResultMap) -> Transaction in Transaction(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Transaction) -> ResultMap in value.resultMap }, forKey: "transactions")
      }
    }

    public struct Transaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Transaction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ListTransactionsTransactionFragment.self),
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

        public var listTransactionsTransactionFragment: ListTransactionsTransactionFragment {
          get {
            return ListTransactionsTransactionFragment(unsafeResultMap: resultMap)
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

public struct CreateTransactionTransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CreateTransaction_TransactionFragment on Transaction {
      __typename
      id
      entries {
        __typename
        id
        account
        debit
        credit
        currency
      }
      status
      description
      tags
      createdAt
      updatedAt
    }
    """

  public static let possibleTypes: [String] = ["Transaction"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("entries", type: .nonNull(.list(.nonNull(.object(Entry.selections))))),
      GraphQLField("status", type: .nonNull(.scalar(TransactionStatus.self))),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(Tag.self))))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, entries: [Entry], status: TransactionStatus, description: String? = nil, tags: [Tag], createdAt: String, updatedAt: String) {
    self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "entries": entries.map { (value: Entry) -> ResultMap in value.resultMap }, "status": status, "description": description, "tags": tags, "createdAt": createdAt, "updatedAt": updatedAt])
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

  public var entries: [Entry] {
    get {
      return (resultMap["entries"] as! [ResultMap]).map { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Entry) -> ResultMap in value.resultMap }, forKey: "entries")
    }
  }

  public var status: TransactionStatus {
    get {
      return resultMap["status"]! as! TransactionStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var tags: [Tag] {
    get {
      return resultMap["tags"]! as! [Tag]
    }
    set {
      resultMap.updateValue(newValue, forKey: "tags")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updatedAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public struct Entry: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Entry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("account", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("debit", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, account: GraphQLID, debit: String, credit: String, currency: String) {
      self.init(unsafeResultMap: ["__typename": "Entry", "id": id, "account": account, "debit": debit, "credit": credit, "currency": currency])
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

    public var account: GraphQLID {
      get {
        return resultMap["account"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "account")
      }
    }

    public var debit: String {
      get {
        return resultMap["debit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "debit")
      }
    }

    public var credit: String {
      get {
        return resultMap["credit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "credit")
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

public struct DeleteTransactionTransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment DeleteTransaction_TransactionFragment on Transaction {
      __typename
      id
      entries {
        __typename
        id
        account
        debit
        credit
        currency
      }
    }
    """

  public static let possibleTypes: [String] = ["Transaction"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("entries", type: .nonNull(.list(.nonNull(.object(Entry.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, entries: [Entry]) {
    self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "entries": entries.map { (value: Entry) -> ResultMap in value.resultMap }])
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

  public var entries: [Entry] {
    get {
      return (resultMap["entries"] as! [ResultMap]).map { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Entry) -> ResultMap in value.resultMap }, forKey: "entries")
    }
  }

  public struct Entry: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Entry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("account", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("debit", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, account: GraphQLID, debit: String, credit: String, currency: String) {
      self.init(unsafeResultMap: ["__typename": "Entry", "id": id, "account": account, "debit": debit, "credit": credit, "currency": currency])
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

    public var account: GraphQLID {
      get {
        return resultMap["account"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "account")
      }
    }

    public var debit: String {
      get {
        return resultMap["debit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "debit")
      }
    }

    public var credit: String {
      get {
        return resultMap["credit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "credit")
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

public struct ListLatestTransactionsTransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ListLatestTransactions_TransactionFragment on Transaction {
      __typename
      id
      entries {
        __typename
        id
        account
        debit
        credit
        currency
      }
      status
      description
      tags
      createdAt
      updatedAt
    }
    """

  public static let possibleTypes: [String] = ["Transaction"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("entries", type: .nonNull(.list(.nonNull(.object(Entry.selections))))),
      GraphQLField("status", type: .nonNull(.scalar(TransactionStatus.self))),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(Tag.self))))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, entries: [Entry], status: TransactionStatus, description: String? = nil, tags: [Tag], createdAt: String, updatedAt: String) {
    self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "entries": entries.map { (value: Entry) -> ResultMap in value.resultMap }, "status": status, "description": description, "tags": tags, "createdAt": createdAt, "updatedAt": updatedAt])
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

  public var entries: [Entry] {
    get {
      return (resultMap["entries"] as! [ResultMap]).map { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Entry) -> ResultMap in value.resultMap }, forKey: "entries")
    }
  }

  public var status: TransactionStatus {
    get {
      return resultMap["status"]! as! TransactionStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var tags: [Tag] {
    get {
      return resultMap["tags"]! as! [Tag]
    }
    set {
      resultMap.updateValue(newValue, forKey: "tags")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updatedAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public struct Entry: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Entry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("account", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("debit", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, account: GraphQLID, debit: String, credit: String, currency: String) {
      self.init(unsafeResultMap: ["__typename": "Entry", "id": id, "account": account, "debit": debit, "credit": credit, "currency": currency])
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

    public var account: GraphQLID {
      get {
        return resultMap["account"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "account")
      }
    }

    public var debit: String {
      get {
        return resultMap["debit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "debit")
      }
    }

    public var credit: String {
      get {
        return resultMap["credit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "credit")
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
  }
}

public struct ListScheduledTransactionsScheduledTransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ListScheduledTransactions_ScheduledTransactionFragment on ScheduledTransaction {
      __typename
      id
      entries {
        __typename
        id
        account
        debit
        credit
        currency
      }
      status
      frequency
      description
      tags
      createdAt
      updatedAt
    }
    """

  public static let possibleTypes: [String] = ["ScheduledTransaction"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("entries", type: .nonNull(.list(.nonNull(.object(Entry.selections))))),
      GraphQLField("status", type: .nonNull(.scalar(TransactionStatus.self))),
      GraphQLField("frequency", type: .scalar(Frequency.self)),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(Tag.self))))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, entries: [Entry], status: TransactionStatus, frequency: Frequency? = nil, description: String? = nil, tags: [Tag], createdAt: String, updatedAt: String) {
    self.init(unsafeResultMap: ["__typename": "ScheduledTransaction", "id": id, "entries": entries.map { (value: Entry) -> ResultMap in value.resultMap }, "status": status, "frequency": frequency, "description": description, "tags": tags, "createdAt": createdAt, "updatedAt": updatedAt])
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

  public var entries: [Entry] {
    get {
      return (resultMap["entries"] as! [ResultMap]).map { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Entry) -> ResultMap in value.resultMap }, forKey: "entries")
    }
  }

  public var status: TransactionStatus {
    get {
      return resultMap["status"]! as! TransactionStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var frequency: Frequency? {
    get {
      return resultMap["frequency"] as? Frequency
    }
    set {
      resultMap.updateValue(newValue, forKey: "frequency")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var tags: [Tag] {
    get {
      return resultMap["tags"]! as! [Tag]
    }
    set {
      resultMap.updateValue(newValue, forKey: "tags")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updatedAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public struct Entry: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Entry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("account", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("debit", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, account: GraphQLID, debit: String, credit: String, currency: String) {
      self.init(unsafeResultMap: ["__typename": "Entry", "id": id, "account": account, "debit": debit, "credit": credit, "currency": currency])
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

    public var account: GraphQLID {
      get {
        return resultMap["account"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "account")
      }
    }

    public var debit: String {
      get {
        return resultMap["debit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "debit")
      }
    }

    public var credit: String {
      get {
        return resultMap["credit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "credit")
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
  }
}

public struct ListTransactionsTransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ListTransactions_TransactionFragment on Transaction {
      __typename
      id
      entries {
        __typename
        id
        account
        debit
        credit
        currency
      }
      status
      description
      tags
      createdAt
      updatedAt
    }
    """

  public static let possibleTypes: [String] = ["Transaction"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("entries", type: .nonNull(.list(.nonNull(.object(Entry.selections))))),
      GraphQLField("status", type: .nonNull(.scalar(TransactionStatus.self))),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(Tag.self))))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, entries: [Entry], status: TransactionStatus, description: String? = nil, tags: [Tag], createdAt: String, updatedAt: String) {
    self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "entries": entries.map { (value: Entry) -> ResultMap in value.resultMap }, "status": status, "description": description, "tags": tags, "createdAt": createdAt, "updatedAt": updatedAt])
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

  public var entries: [Entry] {
    get {
      return (resultMap["entries"] as! [ResultMap]).map { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Entry) -> ResultMap in value.resultMap }, forKey: "entries")
    }
  }

  public var status: TransactionStatus {
    get {
      return resultMap["status"]! as! TransactionStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var tags: [Tag] {
    get {
      return resultMap["tags"]! as! [Tag]
    }
    set {
      resultMap.updateValue(newValue, forKey: "tags")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updatedAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public struct Entry: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Entry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("account", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("debit", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, account: GraphQLID, debit: String, credit: String, currency: String) {
      self.init(unsafeResultMap: ["__typename": "Entry", "id": id, "account": account, "debit": debit, "credit": credit, "currency": currency])
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

    public var account: GraphQLID {
      get {
        return resultMap["account"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "account")
      }
    }

    public var debit: String {
      get {
        return resultMap["debit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "debit")
      }
    }

    public var credit: String {
      get {
        return resultMap["credit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "credit")
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
  }
}
