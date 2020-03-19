import Foundation

public protocol PersistentStorageResourceCoder {
    func resorceUrlFor(resourceId: String) -> URL
    func resorceIdFrom(resourceUrl: URL) -> String
}
