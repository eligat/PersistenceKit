//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

import class Foundation.NSComparisonPredicate

// Type: PersistentPredicateIsEqualTo

public struct PersistentPredicateIsEqualTo<Some, Other>
where Some: PersistentPredicateParameter, Other: PersistentPredicateParameter, Some.Primitive == Other.Primitive, Some.Primitive: Equatable {

    // Topic: Main

    // Exposed

    public var some: Some

    public var other: Other

    // Concealed

    init(_ some: Some, _ other: Other) {
        self.some = some
        self.other = other
    }
}

public func == <Some, Other>(_ some: Some, _ other: Other) -> PersistentPredicateIsEqualTo<Some, Other> {
    .init(some, other)
}

// Protocol: _RawPersistentPredicate

extension PersistentPredicateIsEqualTo: _RawPersistentPredicate {

    // Exposed

    func _getPredicateObject(resourceCoder: PersistentStorageResourceCoder) -> _PersistentPredicateObject {
        Foundation.NSComparisonPredicate(
            leftExpression: some._getPredicateParameterObject(resourceCoder: resourceCoder),
            rightExpression: other._getPredicateParameterObject(resourceCoder: resourceCoder),
            modifier: .direct,
            type: .equalTo,
            options: []
        )
    }
}

// Protocol: ComparisonPredicate

extension PersistentPredicateIsEqualTo: PersistentPredicate {

    // Exposed

    public typealias Predicate = Self

    public typealias Primitive = Some.Primitive

    public var predicate: Predicate {
        self
    }
}
