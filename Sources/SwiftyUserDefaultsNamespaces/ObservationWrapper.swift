import Foundation

private var wrapperKey: UInt8 = 0

class ObservationWrapper: NSObject {
    private weak var originalObserver: NSObject?
    private let originalKeyPath: String
    
    private init(originalObserver: NSObject, originalKeyPath: String) {
        self.originalObserver = originalObserver
        self.originalKeyPath = originalKeyPath
    }
    
    static func create(
        for originalObserver: NSObject, originalKeyPath: String
    ) -> ObservationWrapper {
        let wrapper = ObservationWrapper(
            originalObserver: originalObserver,
            originalKeyPath: originalKeyPath
        )
        objc_setAssociatedObject(
            originalObserver, &wrapperKey,
            wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return wrapper
    }
    
    static func get(for originalObserver: NSObject) -> ObservationWrapper? {
        objc_getAssociatedObject(originalObserver, &wrapperKey)
                as? ObservationWrapper
    }
    
    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        originalObserver?.observeValue(
            forKeyPath: originalKeyPath,
            of: object,
            change: change,
            context: context
        )
    }
}
