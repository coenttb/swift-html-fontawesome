import Foundation
import HTML
import Testing

@testable import HTMLFontAwesome

extension HTML {
    func renderString() -> String {
        String(decoding: render(), as: UTF8.self)
    }
}

@Suite("FontAwesome Icon Tests")
struct FontAwesomeIconTests {

    @Test("Basic icon creation")
    func basicIcon() {
        let icon = FontAwesomeIcon("check")
        let html = icon.renderString()
        #expect(html.contains("fas"))
        #expect(html.contains("fa-check"))
    }

    @Test("Icon with custom style")
    func iconWithStyle() {
        let icon = FontAwesomeIcon("heart", style: .regular)
        let html = icon.renderString()
        #expect(html.contains("far"))
        #expect(html.contains("fa-heart"))
    }

    @Test("Icon with size")
    func iconWithSize() {
        let icon = FontAwesomeIcon("star", size: .x2)
        let html = icon.renderString()
        #expect(html.contains("fa-2x"))
    }

    @Test("Icon with animation")
    func iconWithAnimation() {
        let icon = FontAwesomeIcon("spinner").animate(.spin)
        let html = icon.renderString()
        #expect(html.contains("fa-spin"))
    }

    @Test("Icon with rotation")
    func iconWithRotation() {
        let icon = FontAwesomeIcon("shield").rotate(.rotate90)
        let html = icon.renderString()
        #expect(html.contains("fa-rotate-90"))
    }

    @Test("Icon with flip")
    func iconWithFlip() {
        let icon = FontAwesomeIcon("shield").flip(.horizontal)
        let html = icon.renderString()
        #expect(html.contains("fa-flip-horizontal"))
    }

    @Test("Fixed width icon")
    func fixedWidthIcon() {
        let icon = FontAwesomeIcon("home").fixedWidth()
        let html = icon.renderString()
        #expect(html.contains("fa-fw"))
    }

    @Test("Icon with border")
    func iconWithBorder() {
        let icon = FontAwesomeIcon("quote").border()
        let html = icon.renderString()
        #expect(html.contains("fa-border"))
    }

    @Test("Icon with ARIA label")
    func iconWithAriaLabel() {
        let icon = FontAwesomeIcon("trash").ariaLabel("Delete item")
        let html = icon.renderString()
        #expect(html.contains("aria-label=\"Delete item\""))
    }

    @Test("Icon with ARIA hidden")
    func iconWithAriaHidden() {
        let icon = FontAwesomeIcon("star").ariaHidden()
        let html = icon.renderString()
        #expect(html.contains("aria-hidden=\"true\""))
    }

    @Test("Icon with title")
    func iconWithTitle() {
        let icon = FontAwesomeIcon("info").title("More information")
        let html = icon.renderString()
        #expect(html.contains("title=\"More information\""))
    }

    @Test("Icon from string literal")
    func iconFromStringLiteral() {
        let icon: FontAwesomeIcon = "check"
        let html = icon.renderString()
        #expect(html.contains("fa-check"))
    }

    @Test("Common icon static properties")
    func commonIcons() {
        let checkIcon = FontAwesomeIcon.check
        let html = checkIcon.renderString()
        #expect(html.contains("fa-check"))

        let githubIcon = FontAwesomeIcon.github
        let githubHtml = githubIcon.renderString()
        #expect(githubHtml.contains("fab"))
        #expect(githubHtml.contains("fa-github"))
    }

    @Test("Fluent API chaining")
    func fluentAPIChaining() {
        let icon = FontAwesomeIcon("user")
            .size(.large)
            .style(.regular)
            .animate(.pulse)
            .fixedWidth()
            .border()
            .ariaLabel("User profile")
            .addClass("custom-class")

        let html = icon.renderString()
        #expect(html.contains("fa-lg"))
        #expect(html.contains("far"))
        #expect(html.contains("fa-pulse"))
        #expect(html.contains("fa-fw"))
        #expect(html.contains("fa-border"))
        #expect(html.contains("custom-class"))
    }
}

@Suite("FontAwesome Loading Tests")
struct FontAwesomeLoadingTests {

    @Test("CDN loader")
    func cdnLoader() {
        let cdn = FontAwesomeCDN(version: "6.5.1")
        let html = cdn.renderString()
        #expect(html.contains("cdnjs.cloudflare.com"))
        #expect(html.contains("6.5.1"))
        #expect(html.contains("all.min.css"))
    }

    @Test("CDN script loader")
    func cdnScriptLoader() {
        let cdn = FontAwesomeCDNScript(version: "6.5.1", defer: true)
        let html = cdn.renderString()
        #expect(html.contains("all.min.js"))
        #expect(html.contains("defer"))
    }

    @Test("Kit loader")
    func kitLoader() {
        let kit = FontAwesomeKit(kitId: "abc123")
        let html = kit.renderString()
        #expect(html.contains("kit.fontawesome.com"))
        #expect(html.contains("abc123.js"))
    }

    @Test("Self-hosted loader")
    func selfHostedLoader() {
        let selfHosted = FontAwesomeSelfHosted(
            cssPath: "/assets/fa.css",
            jsPath: "/assets/fa.js"
        )
        let html = selfHosted.renderString()
        #expect(html.contains("/assets/fa.css"))
        #expect(html.contains("/assets/fa.js"))
    }
}

@Suite("FontAwesome Component Tests")
struct FontAwesomeComponentTests {

    @Test("Button with icon")
    func buttonWithIcon() {
        let button = FontAwesomeButton(icon: .download, "Download")
        let html = button.renderString()
        #expect(html.contains("fa-download"))
        #expect(html.contains("Download"))
        #expect(html.contains("<button"))
    }

    @Test("Button with trailing icon")
    func buttonWithTrailingIcon() {
        let button = FontAwesomeButton(
            icon: .arrowRight,
            "Next",
            iconPosition: .trailing
        )
        let html = button.renderString()
        #expect(html.contains("fa-arrow-right"))
        #expect(html.contains("Next"))
    }

    @Test("List with icons")
    func listWithIcons() {
        let list = FontAwesomeList(icon: .check) {
            FontAwesomeListItem(icon: .check, "Item 1")
            FontAwesomeListItem(icon: .times, "Item 2")
        }
        let html = list.renderString()
        #expect(html.contains("fa-ul"))
        #expect(html.contains("fa-check"))
        #expect(html.contains("fa-times"))
        #expect(html.contains("Item 1"))
        #expect(html.contains("Item 2"))
    }

    @Test("Label with icon")
    func labelWithIcon() {
        let label = FontAwesomeLabel(icon: .user, "Profile")
        let html = label.renderString()
        #expect(html.contains("fa-user"))
        #expect(html.contains("Profile"))
    }

    @Test("Icon stack")
    func iconStack() {
        let stack = FontAwesomeStack {
            FontAwesomeStackItem(icon: .circle, size: .x2)
            FontAwesomeStackItem(icon: .flag, size: .x1, inverse: true)
        }
        let html = stack.renderString()
        #expect(html.contains("fa-stack"))
        #expect(html.contains("fa-stack-2x"))
        #expect(html.contains("fa-stack-1x"))
        #expect(html.contains("fa-inverse"))
    }
}

@Suite("FontAwesome Style Tests")
struct FontAwesomeStyleTests {

    @Test("Style class names")
    func styleClassNames() {
        #expect(FontAwesomeStyle.solid.className == "fas")
        #expect(FontAwesomeStyle.regular.className == "far")
        #expect(FontAwesomeStyle.light.className == "fal")
        #expect(FontAwesomeStyle.thin.className == "fat")
        #expect(FontAwesomeStyle.duotone.className == "fad")
        #expect(FontAwesomeStyle.brands.className == "fab")
    }

    @Test("Sharp style class names")
    func sharpStyleClassNames() {
        #expect(FontAwesomeSharpStyle.solid.className == "fass")
        #expect(FontAwesomeSharpStyle.regular.className == "fasr")
        #expect(FontAwesomeSharpStyle.light.className == "fasl")
        #expect(FontAwesomeSharpStyle.thin.className == "fast")
        #expect(FontAwesomeSharpStyle.duotone.className == "fasd")
    }

    @Test("Pro style detection")
    func proStyleDetection() {
        #expect(FontAwesomeStyle.solid.isPro == false)
        #expect(FontAwesomeStyle.regular.isPro == false)
        #expect(FontAwesomeStyle.brands.isPro == false)
        #expect(FontAwesomeStyle.light.isPro == true)
        #expect(FontAwesomeStyle.thin.isPro == true)
        #expect(FontAwesomeStyle.duotone.isPro == true)
    }
}

@Suite("FontAwesome Size Tests")
struct FontAwesomeSizeTests {

    @Test("Size class names")
    func sizeClassNames() {
        #expect(FontAwesomeSize.normal.className == nil)
        #expect(FontAwesomeSize.extraSmall.className == "fa-xs")
        #expect(FontAwesomeSize.small.className == "fa-sm")
        #expect(FontAwesomeSize.large.className == "fa-lg")
        #expect(FontAwesomeSize.extraLarge.className == "fa-xl")
        #expect(FontAwesomeSize.x2.className == "fa-2x")
        #expect(FontAwesomeSize.x10.className == "fa-10x")
        #expect(FontAwesomeSize.custom("my-size").className == "my-size")
    }
}

@Suite("FontAwesome Animation Tests")
struct FontAwesomeAnimationTests {

    @Test("Animation class names")
    func animationClassNames() {
        #expect(FontAwesomeAnimation.beat.className == "fa-beat")
        #expect(FontAwesomeAnimation.bounce.className == "fa-bounce")
        #expect(FontAwesomeAnimation.fade.className == "fa-fade")
        #expect(FontAwesomeAnimation.flip.className == "fa-flip")
        #expect(FontAwesomeAnimation.pulse.className == "fa-pulse")
        #expect(FontAwesomeAnimation.shake.className == "fa-shake")
        #expect(FontAwesomeAnimation.spin.className == "fa-spin")
        #expect(FontAwesomeAnimation.spinReverse.className == "fa-spin-reverse")
    }

    @Test("Rotation class names")
    func rotationClassNames() {
        #expect(FontAwesomeRotation.rotate90.className == "fa-rotate-90")
        #expect(FontAwesomeRotation.rotate180.className == "fa-rotate-180")
        #expect(FontAwesomeRotation.rotate270.className == "fa-rotate-270")
    }

    @Test("Flip class names")
    func flipClassNames() {
        #expect(FontAwesomeFlip.horizontal.className == "fa-flip-horizontal")
        #expect(FontAwesomeFlip.vertical.className == "fa-flip-vertical")
        #expect(FontAwesomeFlip.both.className == "fa-flip-both")
    }
}
