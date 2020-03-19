//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Type: PersistentMapping

public struct PersistentMapping<Aggregate>
where Aggregate: PersistentAggregate {

    // Topic: Main

    // Concealed

    init(resourceCoder: PersistentStorageResourceCoder) {
        _nameMapping = .init()
        _objectMapping = .init()
        _resourceCoder = resourceCoder
    }

    var _nameMapping: [PartialKeyPath<Aggregate>: String]
    var _objectMapping: [String: _PersistentPrimitiveObject]
    let _resourceCoder: PersistentStorageResourceCoder
}

// Topic: Main

extension PersistentMapping {

    // Exposed

    public subscript<Member>(_ keyPath: KeyPath<Aggregate, Member>) -> Member?
    where Member: PersistentPrimitive {
        guard
            let primitiveName = _nameMapping[keyPath],
            let primitiveObject = _objectMapping[primitiveName],
            let primitive = Member(_primitiveObject: primitiveObject, resourceCoder: _resourceCoder)
        else {
            return nil
        }
        return primitive
    }

    public subscript<Member>(_ keyPath: KeyPath<Aggregate, Member?>) -> Member?
    where Member: PersistentPrimitive {
        guard
            let primitiveName = _nameMapping[keyPath],
            let primitiveObject = _objectMapping[primitiveName],
            let primitive = Member(_primitiveObject: primitiveObject, resourceCoder: _resourceCoder)
        else {
            return nil
        }
        return primitive
    }

    public subscript<Member>(_ keyPath: KeyPath<Aggregate, Member>) -> Member?
    where Member: PersistentAggregate {
        guard
            let primitiveName = _nameMapping[keyPath],
            let primitiveObject = _objectMapping[primitiveName],
            let primitive = Member(_primitiveObject: primitiveObject, resourceCoder: _resourceCoder)
        else {
            return nil
        }
        return primitive
    }

    public subscript<Member>(_ keyPath: KeyPath<Aggregate, Member?>) -> Member?
    where Member: PersistentAggregate {
        guard
            let primitiveName = _nameMapping[keyPath],
            let primitiveObject = _objectMapping[primitiveName],
            let primitive = Member(_primitiveObject: primitiveObject, resourceCoder: _resourceCoder)
        else {
            return nil
        }
        return primitive
    }
}
