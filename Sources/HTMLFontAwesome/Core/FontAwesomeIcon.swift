import Foundation
import HTML

public struct FontAwesomeIcon: HTML, Sendable {
  let name: String
  let style: FontAwesomeStyle
  let size: FontAwesomeSize?
  let fixedWidth: Bool
  let animation: FontAwesomeAnimation?
  let rotation: FontAwesomeRotation?
  let flip: FontAwesomeFlip?
  let border: Bool
  let pull: FontAwesomePull?
  let customClasses: [String]
  let ariaLabel: String?
  let ariaHidden: Bool
  let title: String?

  public init(
    _ name: String,
    style: FontAwesomeStyle = .solid,
    size: FontAwesomeSize? = nil,
    fixedWidth: Bool = false,
    animation: FontAwesomeAnimation? = nil,
    rotation: FontAwesomeRotation? = nil,
    flip: FontAwesomeFlip? = nil,
    border: Bool = false,
    pull: FontAwesomePull? = nil,
    customClasses: [String] = [],
    ariaLabel: String? = nil,
    ariaHidden: Bool = false,
    title: String? = nil
  ) {
    self.name = name
    self.style = style
    self.size = size
    self.fixedWidth = fixedWidth
    self.animation = animation
    self.rotation = rotation
    self.flip = flip
    self.border = border
    self.pull = pull
    self.customClasses = customClasses
    self.ariaLabel = ariaLabel
    self.ariaHidden = ariaHidden
    self.title = title
  }

  public var body: some HTML {
    i {}
      .attribute("class", classString)
      .attribute("aria-label", ariaLabel)
      .attribute("aria-hidden", ariaHidden ? "true" : nil)
      .attribute("title", title)
  }

  private var classString: String {
    var classes = [style.className, "fa-\(name)"]

    if let sizeClass = size?.className {
      classes.append(sizeClass)
    }

    if fixedWidth {
      classes.append("fa-fw")
    }

    if let animation = animation {
      classes.append(animation.className)
    }

    if let rotation = rotation {
      classes.append(rotation.className)
    }

    if let flip = flip {
      classes.append(flip.className)
    }

    if border {
      classes.append("fa-border")
    }

    if let pull = pull {
      classes.append(pull.className)
    }

    classes.append(contentsOf: customClasses)

    return classes.joined(separator: " ")
  }
}

extension FontAwesomeIcon: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    self.init(value)
  }
}

extension FontAwesomeIcon {
  public func size(_ size: FontAwesomeSize) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func style(_ style: FontAwesomeStyle) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func animate(_ animation: FontAwesomeAnimation) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func rotate(_ rotation: FontAwesomeRotation) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func flip(_ flip: FontAwesomeFlip) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func fixedWidth(_ fixed: Bool = true) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixed,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func border(_ hasBorder: Bool = true) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: hasBorder,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func pull(_ pull: FontAwesomePull) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func ariaLabel(_ label: String?) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: label,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func ariaHidden(_ hidden: Bool = true) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: hidden,
      title: title
    )
  }

  public func title(_ title: String?) -> Self {
    FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: customClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }

  public func addClass(_ className: String) -> Self {
    var newClasses = customClasses
    newClasses.append(className)
    return FontAwesomeIcon(
      name,
      style: style,
      size: size,
      fixedWidth: fixedWidth,
      animation: animation,
      rotation: rotation,
      flip: flip,
      border: border,
      pull: pull,
      customClasses: newClasses,
      ariaLabel: ariaLabel,
      ariaHidden: ariaHidden,
      title: title
    )
  }
}
