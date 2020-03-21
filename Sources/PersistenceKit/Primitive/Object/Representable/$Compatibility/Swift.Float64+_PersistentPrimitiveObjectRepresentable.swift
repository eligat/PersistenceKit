//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

import class Foundation.NSNumber

// Type: Swift.Float64

// Protocol: _PersistentPrimitiveObjectRepresentable

extension Swift.Float64: _PersistentPrimitiveObjectRepresentable {

    // Exposed

    static var _primitiveObjectVariant: _PersistentPrimitiveObjectVariant {
        ._float64
    }

    init?(_primitiveObject: _PersistentPrimitiveObject, resourceCoder: PersistentStorageResourceCoder?) {
        guard let realmRawPrimitive = _primitiveObject as? Foundation.NSNumber else {
            return nil
        }
        self.init(exactly: realmRawPrimitive)
    }

    func _getPrimitiveObject(resourceCoder: PersistentStorageResourceCoder?) -> _PersistentPrimitiveObject {
        self as Foundation.NSNumber
    }
}
