# swift-html-fontawesome

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" alt="Swift 6.0">
  <img src="https://img.shields.io/badge/Platforms-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20Linux-lightgray.svg" alt="Platforms">
  <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License">
</p>

<p align="center">
  <strong>Type-safe FontAwesome icons for swift-html</strong><br>
  Add beautiful, scalable icons to your Swift HTML projects with compile-time safety
</p>

## Overview

**swift-html-fontawesome** brings the power of FontAwesome 6 to Swift's HTML DSL ecosystem. With type-safe icons, multiple loading strategies, and comprehensive style support, you can add professional icons to your web projects with confidence.

```swift
import HTML
import HTMLFontAwesome

// Simple icon usage
FontAwesomeIcon("check")
    .size(.x2)
    .animate(.bounce)

// Or use pre-defined icons
FontAwesomeIcon.heart
    .style(.solid)
    .color(.red)

// Load FontAwesome (choose your strategy)
FontAwesomeKit(kitId: "your-kit-id")  // Recommended for Pro
FontAwesomeCDN(version: "6.5.1")      // Free icons via CDN
```

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html-fontawesome", from: "0.0.1")
]
```

Then add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "HTMLFontAwesome", package: "swift-html-fontawesome")
    ]
)
```

## Quick Start

### 1. Load FontAwesome

Choose your loading strategy based on your needs:

```swift
// Option A: FontAwesome Kit (Recommended)
FontAwesomeKit(kitId: "abc123def")

// Option B: CDN for free icons
FontAwesomeCDN(version: "6.5.1")

// Option C: Self-hosted files
FontAwesomeSelfHosted(
    cssPath: "/assets/fontawesome/css/all.min.css",
    jsPath: "/assets/fontawesome/js/all.min.js"
)
```

### 2. Use Icons

```swift
// Basic usage
FontAwesomeIcon("user")

// With modifiers
FontAwesomeIcon("spinner")
    .animate(.spin)
    .size(.large)
    .ariaLabel("Loading...")

// Pre-defined common icons
FontAwesomeIcon.check
FontAwesomeIcon.github
FontAwesomeIcon.envelope
```

## Key Features

### 🎨 All FontAwesome Styles

```swift
FontAwesomeIcon("house", style: .solid)     // fas
FontAwesomeIcon("house", style: .regular)   // far
FontAwesomeIcon("github", style: .brands)   // fab

// Pro styles
FontAwesomeIcon("house", style: .light)     // fal
FontAwesomeIcon("house", style: .thin)      // fat
FontAwesomeIcon("house", style: .duotone)   // fad
```

### ⚡ Animations & Transforms

```swift
// Animations
FontAwesomeIcon.bell.animate(.shake)
FontAwesomeIcon.heart.animate(.beat)
FontAwesomeIcon.cog.animate(.spin)

// Rotations & Flips
FontAwesomeIcon.arrow.rotate(.rotate90)
FontAwesomeIcon.shield.flip(.horizontal)
```

### 🧩 Components

```swift
// Button with icon
FontAwesomeButton(icon: .download, "Download Report")

// List with icons
FontAwesomeList {
    FontAwesomeListItem(icon: .check, "Task complete")
    FontAwesomeListItem(icon: .clock, "In progress")
}

// Icon stacking
FontAwesomeStack {
    FontAwesomeStackItem(icon: .circle, size: .x2)
    FontAwesomeStackItem(icon: .flag, size: .x1, inverse: true)
}
```

### ♿ Accessibility

```swift
FontAwesomeIcon.trash
    .ariaLabel("Delete item")
    .title("Click to remove")

// Hide decorative icons
FontAwesomeIcon.star
    .ariaHidden()
```

## Common Icons Reference

The package includes 300+ pre-defined icons as static properties:

- **Actions**: `.check`, `.times`, `.plus`, `.minus`, `.edit`, `.trash`
- **Navigation**: `.home`, `.menu`, `.search`, `.settings`, `.user`
- **Media**: `.play`, `.pause`, `.camera`, `.video`, `.music`
- **Social**: `.github`, `.twitter`, `.linkedin`, `.youtube`
- **Arrows**: `.arrowUp`, `.arrowDown`, `.chevronLeft`, `.chevronRight`
- **Files**: `.file`, `.folder`, `.download`, `.upload`
- And many more...

## Real-World Example

```swift
struct NavigationBar: HTML {
    var body: some HTML {
        nav {
            a(href: "/") {
                FontAwesomeIcon.home
                    .fixedWidth()
                span { "Home" }
                    .marginLeft(.rem(0.5))
            }
            
            a(href: "/search") {
                FontAwesomeIcon.search
                    .fixedWidth()
                span { "Search" }
                    .marginLeft(.rem(0.5))
            }
            
            a(href: "/settings") {
                FontAwesomeIcon.gear
                    .fixedWidth()
                span { "Settings" }
                    .marginLeft(.rem(0.5))
            }
        }
        .display(.flex)
        .gap(.rem(2))
    }
}
```

## FontAwesome Pro Support

This package fully supports FontAwesome Pro features:

1. Create a Kit at [fontawesome.com](https://fontawesome.com)
2. Use the Kit loader: `FontAwesomeKit(kitId: "your-kit-id")`
3. Access all Pro icons and styles

## Migration from Emojis

Easy replacement for emoji-based interfaces:

```swift
// Before
span { "✅ Success" }

// After  
FontAwesomeLabel(icon: .check, "Success")
    .color(.green)
```

## Documentation

For complete documentation, see:
- [FontAwesome Icon Gallery](https://fontawesome.com/icons)
- [swift-html Documentation](https://github.com/coenttb/swift-html)

## License

Licensed under Apache License 2.0. See [LICENSE](LICENSE.md) for details.

Note: This package is not affiliated with Font Awesome. Font Awesome is a registered trademark of Fonticons, Inc.