import Foundation

public extension DefaultsAdapter {
    subscript<T: DefaultsKeyStore>(
        namespace namespace: DefaultsNamespace<T>
    ) -> DefaultsAdapter<T> {
        get {
            let userDefaults = NamespacedUserDefaults(
                base: defaults,
                namespaceKey: namespace.namespaceKey
            )
            return .init(
                defaults: userDefaults,
                keyStore: namespace.keyStore
            )
        }
        nonmutating set {}
    }
    
    subscript<T: DefaultsKeyStore>(
        keyPath: KeyPath<KeyStore, DefaultsNamespace<T>>
    ) -> DefaultsAdapter<T> {
        get {
            self[namespace: keyStore[keyPath: keyPath]]
        }
        nonmutating set {
            self[namespace: keyStore[keyPath: keyPath]] = newValue
        }
    }
    
    subscript<T: DefaultsKeyStore>(
        dynamicMember keyPath: KeyPath<KeyStore, DefaultsNamespace<T>>
    ) -> DefaultsAdapter<T> {
        get {
            self[namespace: keyStore[keyPath: keyPath]]
        }
        nonmutating set {
            self[namespace: keyStore[keyPath: keyPath]] = newValue
        }
    }
}
