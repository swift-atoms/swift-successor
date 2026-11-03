# swift-successor

Use this package when you need the next value of a fixed-width integer and must decide what happens at the top of its range: wrap and be told, fail, or clamp. Start from `Successor`. To step by more than one, use the sibling package swift-advancement; to step down, use swift-predecessor; for a general sum of two values, use `Addition` directly.

## Laws

- Each `Successor` operation is the matching `Addition` operation with a right-hand side of one, so it obeys the same overflow semantics.
- Overflow happens for exactly one input: the greatest value of the type. Every other input yields that input plus one under all three operations.
- At the greatest value, `Successor.reporting` wraps to the least value and flags overflow (for an unsigned type, the result is zero); `Successor.exact` throws `Addition.Error.overflow`; `Successor.saturating` returns the greatest value unchanged.
