# swift-html-fontawesome

[![CI](https://github.com/coenttb/swift-html-fontawesome/workflows/CI/badge.svg)](https://github.com/coenttb/swift-html-fontawesome/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Type-safe FontAwesome 6 icons for Swift HTML DSL with compile-time safety and multiple loading strategies.

## Overview

**swift-html-fontawesome** provides FontAwesome 6 icon support for the swift-html ecosystem. The package offers type-safe icon rendering, multiple loading strategies (Kit, CDN, self-hosted), and complete style support for all free and Pro icon styles.

## Features

- Type-safe icon API with compile-time validation
- Multiple loading strategies: Kit (Pro), CDN (free), and self-hosted
- Support for all FontAwesome styles: solid, regular, light, thin, duotone, brands
- Fluent API for icon configuration (size, animation, rotation, flip)
- Pre-defined static properties for 300+ common icons
- Built-in components: buttons, lists, labels, and icon stacks
- Full accessibility support with ARIA attributes
- Direct integration with swift-html DSL

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html-fontawesome", from: "0.0.1")
]
```

Add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "HTMLFontAwesome", package: "swift-html-fontawesome")
    ]
)
```

## Quick Start

### Loading FontAwesome

Choose a loading strategy based on your needs:

```swift
import HTML
import HTMLFontAwesome

// Option 1: FontAwesome Kit (Recommended for Pro)
FontAwesomeKit(kitId: "your-kit-id")

// Option 2: CDN (Free icons)
FontAwesomeCDN(version: "6.5.1")

// Option 3: Self-hosted
FontAwesomeSelfHosted(
    cssPath: "/assets/fontawesome/css/all.min.css",
    jsPath: "/assets/fontawesome/js/all.min.js"
)
```

### Basic Icon Usage

```swift
// Simple icon
FontAwesomeIcon("check")

// With fluent API
FontAwesomeIcon("spinner")
    .animate(.spin)
    .size(.large)
    .ariaLabel("Loading...")

// Pre-defined icons
FontAwesomeIcon.check
FontAwesomeIcon.github
FontAwesomeIcon.envelope
```

## Usage Examples

### Icon Styles

```swift
// Free styles
FontAwesomeIcon("house", style: .solid)     // fas
FontAwesomeIcon("house", style: .regular)   // far
FontAwesomeIcon("github", style: .brands)   // fab

// Pro styles (requires Kit)
FontAwesomeIcon("house", style: .light)     // fal
FontAwesomeIcon("house", style: .thin)      // fat
FontAwesomeIcon("house", style: .duotone)   // fad
```

### Animations and Transforms

```swift
// Animations
FontAwesomeIcon.bell.animate(.shake)
FontAwesomeIcon.heart.animate(.beat)
FontAwesomeIcon.cog.animate(.spin)

// Rotations
FontAwesomeIcon("arrow-right").rotate(.rotate90)

// Flips
FontAwesomeIcon("shield").flip(.horizontal)
```

### Size Options

```swift
FontAwesomeIcon("star", size: .extraSmall)  // fa-xs
FontAwesomeIcon("star", size: .small)       // fa-sm
FontAwesomeIcon("star", size: .large)       // fa-lg
FontAwesomeIcon("star", size: .extraLarge)  // fa-xl
FontAwesomeIcon("star", size: .x2)          // fa-2x
FontAwesomeIcon("star", size: .x10)         // fa-10x
```

### Components

```swift
// Button with icon
FontAwesomeButton(icon: .download, "Download Report")

// Button with trailing icon
FontAwesomeButton(
    icon: .arrowRight,
    "Next",
    iconPosition: .trailing
)

// Label with icon
FontAwesomeLabel(icon: .user, "Profile")

// List with icons (requires icon parameter to add fa-ul class)
FontAwesomeList(icon: .check) {
    FontAwesomeListItem(icon: .check, "Task complete")
    FontAwesomeListItem(icon: .times, "Task failed")
}

// Icon stacking
FontAwesomeStack {
    FontAwesomeStackItem(icon: .circle, size: .x2)
    FontAwesomeStackItem(icon: .flag, size: .x1, inverse: true)
}
```

### Accessibility

```swift
// Add ARIA label
FontAwesomeIcon.trash
    .ariaLabel("Delete item")

// Add title attribute
FontAwesomeIcon.info
    .title("More information")

// Hide decorative icons from screen readers
FontAwesomeIcon.star
    .ariaHidden()
```

### Fixed Width Icons

```swift
// Useful for aligning icons in lists or navigation
FontAwesomeIcon.home.fixedWidth()      // fa-fw
FontAwesomeIcon.search.fixedWidth()    // fa-fw
FontAwesomeIcon.settings.fixedWidth()  // fa-fw
```

## Common Icons Reference

The package includes 300+ pre-defined icons as static properties:

- **Actions**: `.check`, `.times`, `.xmark`, `.plus`, `.minus`, `.edit`, `.trash`
- **Navigation**: `.home`, `.house`, `.search`, `.settings`, `.gear`
- **Communication**: `.envelope`, `.email`
- **User**: `.user`, `.users`, `.circleUser`
- **Media**: `.play`, `.pause`, `.camera`, `.video`, `.music`
- **Social**: `.github`, `.twitter`, `.linkedin`, `.youtube`
- **Arrows**: `.arrowUp`, `.arrowDown`, `.arrowLeft`, `.arrowRight`
- **Files**: `.file`, `.folder`, `.download`, `.upload`
- **Calendar**: `.calendar`, `.calendarDay`, `.calendarWeek`
- **Symbols**: `.heart`, `.star`, `.bolt`, `.shield`

See `Sources/HTMLFontAwesome/Icons/CommonIcons.swift` for the complete list.

## FontAwesome Pro Support

This package supports all FontAwesome Pro features:

1. Create a Kit at [fontawesome.com](https://fontawesome.com)
2. Use the Kit loader: `FontAwesomeKit(kitId: "your-kit-id")`
3. Access all Pro icons and styles (light, thin, duotone, sharp variants)

## Related Packages

### Dependencies

- [swift-html](https://github.com/coenttb/swift-html): The Swift library for domain-accurate and type-safe HTML & CSS.

## License

This package is licensed under the Apache License 2.0. See [LICENSE](LICENSE.md) for details.

**Note**: This package is not affiliated with Font Awesome. Font Awesome is a registered trademark of Fonticons, Inc.

## Contributing

Contributions are welcome. Please open an issue or pull request on [GitHub](https://github.com/coenttb/swift-html-fontawesome).
