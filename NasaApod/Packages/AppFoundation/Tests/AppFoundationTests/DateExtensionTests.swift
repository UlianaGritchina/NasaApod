import Testing
import Foundation
@testable import AppFoundation

@Suite
struct DateExtensionTests {
    
    private var testDate: Date {
        get throws {
            var calendar = Calendar(identifier: .gregorian)
            calendar.timeZone = try #require(.init(secondsFromGMT: 0))
            
            var components = DateComponents()
            components.year = 2001
            components.month = 12
            components.day = 11
            
            return try #require(calendar.date(from: components))
        }
    }
    
    @Test(arguments: [
        (DateFormat.base, "2001-12-11"),
        (DateFormat.full, "11.12.2001"),
        (DateFormat.custom("dd/MM/yyyy"), "11/12/2001")
    ])
    func toString(format: DateFormat, expected: String) throws {
        let result = try testDate.toString(format: format)
        
        #expect(result == expected)
    }
}
