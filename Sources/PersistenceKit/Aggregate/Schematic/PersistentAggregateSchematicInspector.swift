//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Type: PersistentAggregateSchematicInspector

public protocol PersistentAggregateSchematicInspector {

    // Topic: Main

    // Exposed

    associatedtype Aggregate: PersistentAggregate

    associatedtype Report

    mutating func inspect<Member>(_ memberKeyPath: KeyPath<Aggregate, Member>,
                                  named memberName: String,
                                  resourceCoder: PersistentStorageResourceCoder?)
    where Member: PersistentPrimitive

    mutating func inspect<Member>(_ memberKeyPath: KeyPath<Aggregate, Member>,
                                  named memberName: String,
                                  resourceCoder: PersistentStorageResourceCoder?)
    where Member: PersistentAggregate

    // TODO: Replace this with proper Optional support.
    mutating func inspect<Member>(_ memberKeyPath: KeyPath<Aggregate, Member?>,
                                  named memberName: String,
                                  resourceCoder: PersistentStorageResourceCoder?)
    where Member: PersistentAggregate
    
    mutating func report() -> Report
}
