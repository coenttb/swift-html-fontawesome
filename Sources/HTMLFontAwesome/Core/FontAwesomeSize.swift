import Foundation

public enum FontAwesomeSize: Sendable {
  case extraSmall
  case small
  case normal
  case large
  case extraLarge
  case x2
  case x3
  case x4
  case x5
  case x6
  case x7
  case x8
  case x9
  case x10
  case custom(String)

  public var className: String? {
    switch self {
    case .normal:
      return nil
    case .extraSmall:
      return "fa-xs"
    case .small:
      return "fa-sm"
    case .large:
      return "fa-lg"
    case .extraLarge:
      return "fa-xl"
    case .x2:
      return "fa-2x"
    case .x3:
      return "fa-3x"
    case .x4:
      return "fa-4x"
    case .x5:
      return "fa-5x"
    case .x6:
      return "fa-6x"
    case .x7:
      return "fa-7x"
    case .x8:
      return "fa-8x"
    case .x9:
      return "fa-9x"
    case .x10:
      return "fa-10x"
    case .custom(let value):
      return value
    }
  }
}
