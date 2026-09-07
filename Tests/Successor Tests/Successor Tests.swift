import Addition
import Successor
import Testing

@Suite
struct `Successor checks and saturates movement to the next value` {

    @Test
    func `Successor reports and throws at the greatest value`() {
        let report = Successor.reporting(UInt.max)
        #expect(report.value == 0)
        #expect(report.overflow)
        #expect(throws: Addition.Error.overflow) {
            try Successor.exact(UInt.max)
        }
    }

    @Test
    func `Exact and saturating successor operations select the next value`() throws {
        #expect(try Successor.exact(UInt(41)) == 42)
        #expect(Successor.saturating(UInt.max) == UInt.max)
    }
}
