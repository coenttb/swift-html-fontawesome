import Foundation
import HTML

public struct FontAwesomeList<Content: HTML>: HTML {
  let icon: FontAwesomeIcon?
  let content: Content

  public init(
    icon: FontAwesomeIcon? = nil,
    @HTMLBuilder content: () -> Content
  ) {
    self.icon = icon
    self.content = content()
  }

  public var body: some HTML {
    ul {
      content
    }
    .attribute("class", icon != nil ? "fa-ul" : nil)
  }
}

public struct FontAwesomeListItem<Content: HTML>: HTML {
  let icon: FontAwesomeIcon
  let content: Content

  public init(
    icon: FontAwesomeIcon,
    @HTMLBuilder content: () -> Content
  ) {
    self.icon = icon
    self.content = content()
  }

  public init(
    icon: FontAwesomeIcon,
    _ text: String
  ) where Content == HTMLText {
    self.icon = icon
    self.content = HTMLText(text)
  }

  public var body: some HTML {
    li {
      span {
        icon
      }
      .attribute("class", "fa-li")

      content
    }
  }
}
