import Foundation
import HTML

public struct FontAwesomeStack<Content: HTML>: HTML {
    let content: Content
    let size: FontAwesomeSize?

    public init(
        size: FontAwesomeSize? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.size = size
        self.content = content()
    }

    public var body: some HTML {
        span {
            content
        }
        .attribute("class", classString)
    }

    private var classString: String {
        var classes = ["fa-stack"]
        if let sizeClass = size?.className {
            classes.append(sizeClass)
        }
        return classes.joined(separator: " ")
    }
}

public struct FontAwesomeStackItem: HTML {
    let icon: FontAwesomeIcon
    let size: StackItemSize
    let inverse: Bool

    public enum StackItemSize: String {
        case x1 = "fa-stack-1x"
        case x2 = "fa-stack-2x"
    }

    public init(
        icon: FontAwesomeIcon,
        size: StackItemSize = .x1,
        inverse: Bool = false
    ) {
        self.icon = icon
        self.size = size
        self.inverse = inverse
    }

    public var body: some HTML {
        icon.addClass(size.rawValue)
            .addClass(inverse ? "fa-inverse" : "")
    }
}
