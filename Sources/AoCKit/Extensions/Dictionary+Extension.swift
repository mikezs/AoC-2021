import Foundation

extension Dictionary {
    func setting(key: Key, value: Value) -> [Key: Value] {
        var copy = self
        copy[key] = value
        return copy
    }
}
