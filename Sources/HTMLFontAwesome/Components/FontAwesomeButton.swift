import Foundation
import HTML

public struct FontAwesomeButton<Content: HTML>: HTML {
  public enum IconPosition {
    case leading
    case trailing
  }

  let icon: FontAwesomeIcon
  let content: Content
  let iconPosition: IconPosition
  let spacing: LengthPercentage

  public init(
    icon: FontAwesomeIcon,
    iconPosition: IconPosition = .leading,
    spacing: LengthPercentage = .rem(0.5),
    @HTMLBuilder content: () -> Content
  ) {
    self.icon = icon
    self.iconPosition = iconPosition
    self.spacing = spacing
    self.content = content()
  }

  public init(
    icon: FontAwesomeIcon,
    _ text: String,
    iconPosition: IconPosition = .leading,
    spacing: LengthPercentage = .rem(0.5)
  ) where Content == HTMLText {
    self.icon = icon
    self.iconPosition = iconPosition
    self.spacing = spacing
    self.content = HTMLText(text)
  }

  public var body: some HTML {
    button {
      switch iconPosition {
      case .leading:
        icon
          .marginRight(.lengthPercentage(spacing))
        content
      case .trailing:
        content
        icon
          .marginLeft(.lengthPercentage(spacing))
      }
    }
  }
}
