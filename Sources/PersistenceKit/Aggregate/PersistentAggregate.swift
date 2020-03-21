//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Type: PersistentAggregate

public protocol PersistentAggregate {

    // Topic: Main

    // Exposed

    associatedtype Schematic: PersistentAggregateSchematic
    where Schematic.Aggregate == Self

    static var schematic: Schematic { get }
}

// Topic: Main

extension PersistentAggregate {

    // Concealed
    
    static var _aggregateObjectVariant: _PersistentAggregateObjectVariant {
        let schematic = Self.schematic
        var inspector = _PersistentAggregateObjectVariant._SchematicInspector<Self>(
            _aggregateName: schematic.aggregateName,
            _idKeyPath: schematic.idKeyPath
        )
        schematic.report(to: &inspector, resourceCoder: nil)
        return inspector.report()
    }

    static var _aggregateObjectType: _PersistentAggregateObject.Type {
        Self._aggregateObjectVariant._persistentAggregateObjectType()
    }

    static var _hasID: Bool {
        !(Schematic.ID.self == Never.self || Schematic.ID.self == Never?.self)
    }

    // inject storage to create url
    init?(_aggregateObject: _PersistentAggregateObject, resourceCoder: PersistentStorageResourceCoder?) {
        let schematic = Self.schematic
        var inspector = PersistentMapping<Self>._InputSchematicInspector(
            _aggregateObject: _aggregateObject,
            resourceCoder: resourceCoder)
        schematic.report(to: &inspector, resourceCoder: resourceCoder)
        let persistentPrimitiveMapping = inspector.report()
        guard let instance = schematic.aggregate(from: persistentPrimitiveMapping, resourceCoder: resourceCoder) else {
            return nil
        }
        self = instance
    }

    var _id: Schematic.ID {
        self[keyPath: Self.schematic.idKeyPath]
    }

    func _getMapping(resourceCoder: PersistentStorageResourceCoder?) -> PersistentMapping<Self> {
        var inspector = PersistentMapping<Self>._OutputSchematicInspector(_aggregate: self, resourceCoder: resourceCoder)
        Self.schematic.report(to: &inspector, resourceCoder: resourceCoder)
        return inspector.report()
    }

    func _getAggregateObject(resourceCoder: PersistentStorageResourceCoder?) -> _PersistentAggregateObject {
        let persistentAggregateObjectVariant = Self._aggregateObjectVariant
        let persistentAggregateObjectType = persistentAggregateObjectVariant._persistentAggregateObjectType()
        let mapping = _getMapping(resourceCoder: resourceCoder)._objectMapping
        let persistentAggregateObject = persistentAggregateObjectType.init(value: mapping)
        return persistentAggregateObject
    }
}
