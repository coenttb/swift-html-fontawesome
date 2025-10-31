import Foundation
import HTML

public struct FontAwesomeKit: FontAwesomeLoader {
  public let kitId: String
  public let async: Async
  public let crossorigin: Crossorigin?

  public var loadingStrategy: LoadingStrategy {
    .kit(id: kitId)
  }

  public init(
    kitId: String,
    async: Async = true,
    crossorigin: Crossorigin? = "anonymous"
  ) {
    self.kitId = kitId
    self.async = async
    self.crossorigin = crossorigin
  }

  public var body: some HTML {
    script(
      src: "https://kit.fontawesome.com/\(kitId).js",
      async: async,
      crossorigin: crossorigin
    )
  }
}
