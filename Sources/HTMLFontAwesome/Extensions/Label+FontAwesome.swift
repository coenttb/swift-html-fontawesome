import Foundation
import HTML

public struct FontAwesomeLabel<Title: HTML>: HTML {
    let icon: FontAwesomeIcon
    let title: Title
    let spacing: LengthPercentage
    let alignment: AlignItems

    public enum IconPosition {
        case leading
        case trailing
    }

    let iconPosition: IconPosition

    public init(
        icon: FontAwesomeIcon,
        spacing: LengthPercentage = .rem(0.25),
        alignment: AlignItems = .center,
        iconPosition: IconPosition = .leading,
        @HTMLBuilder title: () -> Title
    ) {
        self.icon = icon
        self.spacing = spacing
        self.alignment = alignment
        self.iconPosition = iconPosition
        self.title = title()
    }

    public init(
        icon: FontAwesomeIcon,
        _ text: String,
        spacing: LengthPercentage = .rem(0.25),
        alignment: AlignItems = .center,
        iconPosition: IconPosition = .leading
    ) where Title == HTMLText {
        self.icon = icon
        self.spacing = spacing
        self.alignment = alignment
        self.iconPosition = iconPosition
        self.title = HTMLText(text)
    }

    public var body: some HTML {
        span {
            switch iconPosition {
            case .leading:
                icon
                span {
                    title
                }
                .marginLeft(.lengthPercentage(spacing))
            case .trailing:
                span {
                    title
                }
                .marginRight(.lengthPercentage(spacing))
                icon
            }
        }
        .display(.inlineFlex)
        .alignItems(alignment)
    }
}
