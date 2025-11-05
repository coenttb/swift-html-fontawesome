import Foundation
import HTML

public struct FontAwesomeSelfHosted: FontAwesomeLoader {
    public let cssPath: Href
    public let jsPath: Src?
    public let `defer`: Defer
    public let async: Async

    public var loadingStrategy: LoadingStrategy {
        .selfHosted(path: cssPath)
    }

    public init(
        cssPath: Href,
        jsPath: Src? = nil,
        defer: Defer = true,
        async: Async = false
    ) {
        self.cssPath = cssPath
        self.jsPath = jsPath
        self.defer = `defer`
        self.async = async
    }

    public var body: some HTML {
        HTMLGroup {
            link(
                href: cssPath,
                rel: "stylesheet"
            )

            if let jsPath = jsPath {
                script(
                    src: jsPath,
                    async: async,
                    defer: `defer`
                )
            }
        }
    }
}
