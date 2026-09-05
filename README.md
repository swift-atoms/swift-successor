# Successor

`Successor` identifies and implements selection of the next fixed-width integer.
Its `reporting`, `exact`, and `saturating` policies delegate to Addition with an
increment of one. Exact failure is `Addition.Error.overflow`.
