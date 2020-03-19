import Foundation

extension PersistentStorage: PersistentStorageResourceCoder {
    public func resorceUrlFor(resourceId: String) -> URL {
        return self._resourceDirectory.appendingPathComponent(resourceId)
    }

    public func resorceIdFrom(resourceUrl: URL) -> String {
        return resourceUrl.lastPathComponent
    }
}
