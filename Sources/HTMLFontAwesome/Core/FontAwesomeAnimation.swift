import Foundation

public enum FontAwesomeAnimation: String, Sendable, CaseIterable {
    case beat = "fa-beat"
    case beatFade = "fa-beat-fade"
    case bounce = "fa-bounce"
    case fade = "fa-fade"
    case flip = "fa-flip"
    case pulse = "fa-pulse"
    case shake = "fa-shake"
    case spin = "fa-spin"
    case spinPulse = "fa-spin-pulse"
    case spinReverse = "fa-spin-reverse"
    
    public var className: String {
        self.rawValue
    }
}

public enum FontAwesomeRotation: String, Sendable, CaseIterable {
    case rotate90 = "fa-rotate-90"
    case rotate180 = "fa-rotate-180"
    case rotate270 = "fa-rotate-270"
    case rotateBy = "fa-rotate-by"
    
    public var className: String {
        self.rawValue
    }
}

public enum FontAwesomeFlip: String, Sendable, CaseIterable {
    case horizontal = "fa-flip-horizontal"
    case vertical = "fa-flip-vertical"
    case both = "fa-flip-both"
    
    public var className: String {
        self.rawValue
    }
}

public enum FontAwesomePull: String, Sendable, CaseIterable {
    case left = "fa-pull-left"
    case right = "fa-pull-right"
    
    public var className: String {
        self.rawValue
    }
}