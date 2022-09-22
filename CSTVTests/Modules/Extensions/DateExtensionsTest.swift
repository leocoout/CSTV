import XCTest

@testable import CSTV

final class DateExtensionTests: XCTestCase {
    
    func test_stringWithFormat_shouldReturnCorrectFormattedString() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'00:00:00Z"
        let expectedDate = formatter.date(from: "2022-09-20T00:24:44Z") ?? Date()
        
        XCTAssertEqual(expectedDate.string(withFormat: "dd.MM.yyyy"), "21.09.2022")
    }
}
