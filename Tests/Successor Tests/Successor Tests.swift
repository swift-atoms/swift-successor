import Addition
import Successor
import Testing

@Suite
struct `Successor Tests` {

    @Test
    func `reports and throws at the greatest value`() {
        let report = Successor.reporting(UInt.max)
        #expect(report.value == 0)
        #expect(report.overflow)
        #expect(throws: Addition.Error.overflow) {
            try Successor.exact(UInt.max)
        }
    }

    @Test
    func `exact and saturating select the next value`() throws {
        #expect(try Successor.exact(UInt(41)) == 42)
        #expect(Successor.saturating(UInt.max) == UInt.max)
    }
}
