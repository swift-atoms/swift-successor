public import Addition

/// The identity and fixed-width integer kernel for selecting a next value.
public enum Successor {}

extension Successor {

    @inlinable
    public static func reporting<Value: FixedWidthInteger>(
        _ value: Value
    ) -> (value: Value, overflow: Bool) {
        Addition.reporting(value, 1)
    }

    @inlinable
    public static func exact<Value: FixedWidthInteger>(
        _ value: Value
    ) throws(Addition.Error) -> Value {
        try Addition.exact(value, 1)
    }

    @inlinable
    public static func saturating<Value: FixedWidthInteger>(_ value: Value) -> Value {
        Addition.saturating(value, 1)
    }
}
