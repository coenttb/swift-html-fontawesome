import Foundation
import HTML

public struct FontAwesomeCDN: FontAwesomeLoader {
  public let version: String
  public let integrity: Integrity?
  public let crossorigin: Crossorigin?
  public let `defer`: Defer
  public let async: Async

  public var loadingStrategy: LoadingStrategy {
    .cdn(version: version)
  }

  public init(
    version: String = "6.5.1",
    integrity: Integrity? = nil,
    crossorigin: Crossorigin? = "anonymous",
    defer: Defer = true,
    async: Async = false
  ) {
    self.version = version
    self.integrity = integrity
    self.crossorigin = crossorigin
    self.defer = `defer`
    self.async = async
  }

  public var body: some HTML {
    link(
      crossorigin: crossorigin,
      href: .init("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/css/all.min.css"),
      integrity: integrity,
      referrerpolicy: .noReferrer,
      rel: .stylesheet
    )
    .attribute(Defer.attribute, `defer`.description)
  }
}

public struct FontAwesomeCDNScript: FontAwesomeLoader {
  public let version: String
  public let integrity: Integrity?
  public let crossorigin: Crossorigin?
  public let `defer`: Defer
  public let async: Async

  public var loadingStrategy: LoadingStrategy {
    .cdn(version: version)
  }

  public init(
    version: String = "6.5.1",
    integrity: Integrity? = nil,
    crossorigin: Crossorigin? = "anonymous",
    defer: Defer = true,
    async: Async = false
  ) {
    self.version = version
    self.integrity = integrity
    self.crossorigin = crossorigin
    self.defer = `defer`
    self.async = async
  }

  public var body: some HTML {
    script(
      src: .init("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/js/all.min.js"),
      async: async,
      defer: `defer`,
      integrity: integrity,
      referrerpolicy: .noReferrer,
      crossorigin: crossorigin
    )

    link(
      crossorigin: crossorigin,
      href: .init("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/css/all.min.css"),
      integrity: integrity,
      referrerpolicy: .noReferrer,
      rel: .stylesheet
    )

  }
}
