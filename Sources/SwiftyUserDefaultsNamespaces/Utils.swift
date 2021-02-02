import Foundation

extension Sequence {
    func dictionary<Key, Value>() -> [Key: Value]
    where Element == (Key, Value),
          Key: Hashable
    {
        .init(uniqueKeysWithValues: self)
    }
}
