import Testing
@testable import HTMLFontAwesome
import HTML
import Foundation

@Suite("README Verification")
struct ReadmeVerificationTests {

    @Test("Loading FontAwesome - Kit (line 54-55)")
    func loadingFontAwesomeKit() {
        let loader = FontAwesomeKit(kitId: "your-kit-id")
        let html = loader.renderString()
        #expect(html.contains("kit.fontawesome.com"))
        #expect(html.contains("your-kit-id"))
    }

    @Test("Loading FontAwesome - CDN (line 57-58)")
    func loadingFontAwesomeCDN() {
        let loader = FontAwesomeCDN(version: "6.5.1")
        let html = loader.renderString()
        #expect(html.contains("cdnjs.cloudflare.com"))
        #expect(html.contains("6.5.1"))
    }

    @Test("Loading FontAwesome - Self-hosted (line 60-64)")
    func loadingFontAwesomeSelfHosted() {
        let loader = FontAwesomeSelfHosted(
            cssPath: "/assets/fontawesome/css/all.min.css",
            jsPath: "/assets/fontawesome/js/all.min.js"
        )
        let html = loader.renderString()
        #expect(html.contains("/assets/fontawesome/css/all.min.css"))
        #expect(html.contains("/assets/fontawesome/js/all.min.js"))
    }

    @Test("Basic Icon Usage - Simple icon (line 70-71)")
    func basicIconUsageSimple() {
        let icon = FontAwesomeIcon("check")
        let html = icon.renderString()
        #expect(html.contains("fa-check"))
    }

    @Test("Basic Icon Usage - Fluent API (line 73-77)")
    func basicIconUsageFluent() {
        let icon = FontAwesomeIcon("spinner")
            .animate(.spin)
            .size(.large)
            .ariaLabel("Loading...")
        let html = icon.renderString()
        #expect(html.contains("fa-spinner"))
        #expect(html.contains("fa-spin"))
        #expect(html.contains("fa-lg"))
        #expect(html.contains("aria-label=\"Loading...\""))
    }

    @Test("Basic Icon Usage - Pre-defined icons (line 79-82)")
    func basicIconUsagePredefined() {
        let check = FontAwesomeIcon.check
        let github = FontAwesomeIcon.github
        let envelope = FontAwesomeIcon.envelope

        #expect(check.renderString().contains("fa-check"))
        #expect(github.renderString().contains("fa-github"))
        #expect(envelope.renderString().contains("fa-envelope"))
    }

    @Test("Icon Styles - Free styles (line 90-93)")
    func iconStylesFree() {
        let solid = FontAwesomeIcon("house", style: .solid)
        let regular = FontAwesomeIcon("house", style: .regular)
        let brands = FontAwesomeIcon("github", style: .brands)

        #expect(solid.renderString().contains("fas"))
        #expect(regular.renderString().contains("far"))
        #expect(brands.renderString().contains("fab"))
    }

    @Test("Icon Styles - Pro styles (line 95-98)")
    func iconStylesPro() {
        let light = FontAwesomeIcon("house", style: .light)
        let thin = FontAwesomeIcon("house", style: .thin)
        let duotone = FontAwesomeIcon("house", style: .duotone)

        #expect(light.renderString().contains("fal"))
        #expect(thin.renderString().contains("fat"))
        #expect(duotone.renderString().contains("fad"))
    }

    @Test("Animations and Transforms - Animations (line 104-107)")
    func animationsAndTransforms() {
        let bell = FontAwesomeIcon.bell.animate(.shake)
        let heart = FontAwesomeIcon.heart.animate(.beat)
        let cog = FontAwesomeIcon.cog.animate(.spin)

        #expect(bell.renderString().contains("fa-shake"))
        #expect(heart.renderString().contains("fa-beat"))
        #expect(cog.renderString().contains("fa-spin"))
    }

    @Test("Animations and Transforms - Rotations (line 109-110)")
    func rotations() {
        let icon = FontAwesomeIcon("arrow-right").rotate(.rotate90)
        #expect(icon.renderString().contains("fa-rotate-90"))
    }

    @Test("Animations and Transforms - Flips (line 112-113)")
    func flips() {
        let icon = FontAwesomeIcon("shield").flip(.horizontal)
        #expect(icon.renderString().contains("fa-flip-horizontal"))
    }

    @Test("Size Options (line 118-125)")
    func sizeOptions() {
        #expect(FontAwesomeIcon("star", size: .extraSmall).renderString().contains("fa-xs"))
        #expect(FontAwesomeIcon("star", size: .small).renderString().contains("fa-sm"))
        #expect(FontAwesomeIcon("star", size: .large).renderString().contains("fa-lg"))
        #expect(FontAwesomeIcon("star", size: .extraLarge).renderString().contains("fa-xl"))
        #expect(FontAwesomeIcon("star", size: .x2).renderString().contains("fa-2x"))
        #expect(FontAwesomeIcon("star", size: .x10).renderString().contains("fa-10x"))
    }

    @Test("Components - Button with icon (line 130-131)")
    func componentsButton() {
        let button = FontAwesomeButton(icon: .download, "Download Report")
        let html = button.renderString()
        #expect(html.contains("fa-download"))
        #expect(html.contains("Download Report"))
        #expect(html.contains("<button"))
    }

    @Test("Components - Button with trailing icon (line 133-138)")
    func componentsButtonTrailing() {
        let button = FontAwesomeButton(
            icon: .arrowRight,
            "Next",
            iconPosition: .trailing
        )
        let html = button.renderString()
        #expect(html.contains("fa-arrow-right"))
        #expect(html.contains("Next"))
    }

    @Test("Components - Label with icon (line 140-141)")
    func componentsLabel() {
        let label = FontAwesomeLabel(icon: .user, "Profile")
        let html = label.renderString()
        #expect(html.contains("fa-user"))
        #expect(html.contains("Profile"))
    }

    @Test("Components - List with icons (line 143-147)")
    func componentsList() {
        let list = FontAwesomeList(icon: .check) {
            FontAwesomeListItem(icon: .check, "Task complete")
            FontAwesomeListItem(icon: .times, "Task failed")
        }
        let html = list.renderString()
        #expect(html.contains("fa-ul"))
        #expect(html.contains("fa-check"))
        #expect(html.contains("fa-times"))
        #expect(html.contains("Task complete"))
        #expect(html.contains("Task failed"))
    }

    @Test("Components - Icon stacking (line 149-153)")
    func componentsStack() {
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

    @Test("Accessibility - ARIA label (line 159-161)")
    func accessibilityAriaLabel() {
        let icon = FontAwesomeIcon.trash
            .ariaLabel("Delete item")
        let html = icon.renderString()
        #expect(html.contains("aria-label=\"Delete item\""))
    }

    @Test("Accessibility - Title attribute (line 163-165)")
    func accessibilityTitle() {
        let icon = FontAwesomeIcon.info
            .title("More information")
        let html = icon.renderString()
        #expect(html.contains("title=\"More information\""))
    }

    @Test("Accessibility - ARIA hidden (line 167-169)")
    func accessibilityAriaHidden() {
        let icon = FontAwesomeIcon.star
            .ariaHidden()
        let html = icon.renderString()
        #expect(html.contains("aria-hidden=\"true\""))
    }

    @Test("Fixed Width Icons (line 175-178)")
    func fixedWidthIcons() {
        #expect(FontAwesomeIcon.home.fixedWidth().renderString().contains("fa-fw"))
        #expect(FontAwesomeIcon.search.fixedWidth().renderString().contains("fa-fw"))
        #expect(FontAwesomeIcon.settings.fixedWidth().renderString().contains("fa-fw"))
    }
}
