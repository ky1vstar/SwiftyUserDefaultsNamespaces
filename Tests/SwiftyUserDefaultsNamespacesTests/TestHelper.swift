import Foundation
import SwiftyUserDefaultsNamespaces

struct Color: Codable, Equatable, DefaultsSerializable {
    static let black = Color(red: 0, green: 0, blue: 0, alpha: 1)
    static let white = Color(red: 1, green: 1, blue: 1, alpha: 1)
    static let red = Color(red: 1, green: 0, blue: 0, alpha: 1)
    static let green = Color(red: 0, green: 1, blue: 0, alpha: 1)
    static let blue = Color(red: 0, green: 0, blue: 1, alpha: 1)
    
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
}

extension DefaultsKeys {
    var drawer: DefaultsNamespace<DrawerKeys> {
        .init(namespaceKey: "drawer", keyStore: .init())
    }
}

struct DrawerKeys: DefaultsKeyStore {
    var lineWidth: DefaultsKey<Double?> { .init("lineWidth") }
    var color: DefaultsKey<Color> { .init("color", defaultValue: .black) }
}
