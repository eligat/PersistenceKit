//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

import struct Foundation.Date

// Type: Foundation.Date

// Protocol: _RawPersistentPredicateParameter

extension Foundation.Date: _RawPersistentPredicateParameter {

    // Exposed

    func _getPredicateParameterObject(resourceCoder: PersistentStorageResourceCoder) -> _PersistentPredicateParameterObject {
        .init(forConstantValue: _getPrimitiveObject(resourceCoder: resourceCoder))
    }
}
