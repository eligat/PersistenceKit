//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Type: Swift.Int

// Protocol: PersistentPredicateParameter

extension Swift.Int: PersistentPredicateParameter {

    // Exposed

    public typealias Parameter = Self

    public var parameter: Parameter {
        self
    }
}
