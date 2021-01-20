import Foundation
import SwiftyUserDefaults

public extension DefaultsAdapter {
    func namespace<T: DefaultsKeyStore>(
        _ namespace: DefaultsNamespace<T>
    ) -> DefaultsAdapter<T> {
        let userDefaults = NamespacedUserDefaults(
            base: defaults,
            namespaceKey: namespace.namespaceKey
        )
        return .init(
            defaults: userDefaults,
            keyStore: namespace.keyStore
        )
    }
    
    subscript<T: DefaultsKeyStore>(
        dynamicMember keyPath: KeyPath<KeyStore, DefaultsNamespace<T>>
    ) -> DefaultsAdapter<T> {
        get {
            namespace(keyStore[keyPath: keyPath])
        }
        nonmutating set {}
    }
}
