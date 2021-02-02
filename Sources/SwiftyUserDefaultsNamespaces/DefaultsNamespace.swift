import Foundation

public struct DefaultsNamespace<Store: DefaultsKeyStore> {
    public var namespaceKey: String
    public var keyStore: Store
    
    public init(namespaceKey: String, keyStore: Store) {
        self.namespaceKey = namespaceKey
        self.keyStore = keyStore
    }
}
