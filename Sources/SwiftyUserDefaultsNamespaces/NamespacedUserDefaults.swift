import Foundation

class NamespacedUserDefaults: UserDefaults {
    private var base: UserDefaults!
    private var namespaceKey: String!
    private var nsNamespaceKey: NSString!
    
    convenience init(base: UserDefaults, namespaceKey: String) {
        self.init()
        
        if let namespaced = base as? NamespacedUserDefaults {
            self.base = namespaced.base
            self.namespaceKey = namespaced
                .resolvedKey(for: namespaceKey)
        } else {
            self.base = base
            self.namespaceKey = namespaceKey
        }
        nsNamespaceKey = namespaceKey as NSString
    }
    
    @nonobjc
    private func resolvedKey(for key: String) -> String {
        nsNamespaceKey.appendingPathComponent(key)
    }
    
    override func removeObject(forKey defaultName: String) {
        base.removeObject(forKey: resolvedKey(for: defaultName))
    }
    
    override func object(forKey defaultName: String) -> Any? {
        base.object(forKey: resolvedKey(for: defaultName))
    }
    
    override func string(forKey defaultName: String) -> String? {
        base.string(forKey: resolvedKey(for: defaultName))
    }
    
    override func array(forKey defaultName: String) -> [Any]? {
        base.array(forKey: resolvedKey(for: defaultName))
    }
    
    override func dictionary(forKey defaultName: String) -> [String: Any]? {
        base.dictionary(forKey: resolvedKey(for: defaultName))
    }
    
    override func data(forKey defaultName: String) -> Data? {
        base.data(forKey: resolvedKey(for: defaultName))
    }
    
    override func stringArray(forKey defaultName: String) -> [String]? {
        base.stringArray(forKey: resolvedKey(for: defaultName))
    }
    
    override func integer(forKey defaultName: String) -> Int {
        base.integer(forKey: resolvedKey(for: defaultName))
    }
    
    override func float(forKey defaultName: String) -> Float {
        base.float(forKey: resolvedKey(for: defaultName))
    }
    
    override func double(forKey defaultName: String) -> Double {
        base.double(forKey: resolvedKey(for: defaultName))
    }
    
    override func bool(forKey defaultName: String) -> Bool {
        base.bool(forKey: resolvedKey(for: defaultName))
    }
    
    override func url(forKey defaultName: String) -> URL? {
        base.url(forKey: resolvedKey(for: defaultName))
    }
    
    override func dictionaryRepresentation() -> [String: Any] {
        return base.dictionaryRepresentation()
            .filter { $0.key.hasPrefix(namespaceKey) }
            .map { (
                String($0.key.dropFirst(namespaceKey.count)),
                $0.value
            ) }
            .dictionary()
    }
    
    override func set(_ value: Any?, forKey defaultName: String) {
        base.set(value, forKey: resolvedKey(for: defaultName))
    }
    
    override func set(_ value: Int, forKey defaultName: String) {
        base.set(value, forKey: resolvedKey(for: defaultName))
    }
    
    override func set(_ value: Float, forKey defaultName: String) {
        base.set(value, forKey: resolvedKey(for: defaultName))
    }
    
    override func set(_ value: Double, forKey defaultName: String) {
        base.set(value, forKey: resolvedKey(for: defaultName))
    }
    
    override func set(_ value: Bool, forKey defaultName: String) {
        base.set(value, forKey: resolvedKey(for: defaultName))
    }
    
    override func set(_ url: URL?, forKey defaultName: String) {
        base.set(url, forKey: resolvedKey(for: defaultName))
    }
    
    override func synchronize() -> Bool {
        base.synchronize()
    }
    
    override func addObserver(
        _ observer: NSObject,
        forKeyPath keyPath: String,
        options: NSKeyValueObservingOptions = [],
        context: UnsafeMutableRawPointer?
    ) {
        let wrapper = ObservationWrapper
            .create(for: observer, originalKeyPath: keyPath)
        
        base.addObserver(
            wrapper,
            forKeyPath: resolvedKey(for: keyPath),
            options: options,
            context: context
        )
    }
    
    override func removeObserver(
        _ observer: NSObject,
        forKeyPath keyPath: String,
        context: UnsafeMutableRawPointer?
    ) {
        guard let wrapper = ObservationWrapper.get(for: observer) else {
            return
        }
        
        base.removeObserver(
            wrapper,
            forKeyPath: resolvedKey(for: keyPath),
            context: context
        )
    }
}
