//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Type: Swift.String

// Protocol: PersistentPrimitive

extension Swift.String: PersistentPrimitive {

    // Exposed

    public typealias Primitive = Self

    public init(primitive: Primitive) {
        self = primitive
    }

    public var primitive: Primitive {
        self
    }
}
