import XCTest

@testable import CSTV

final class MatchDateFormatterTests: XCTestCase {
    
    private let calendarSpy = CalendarSpy()
    private lazy var sut = MatchDateFormatter(
        calendar: calendarSpy
    )
    
    func test_format_withNilStr_shouldReturnNil() {
        let expectedResult = sut.format(nil)
        XCTAssertNil(expectedResult)
    }
    
    func test_format_whenDayIsToday_shouldReturnCorrectString() {
        calendarSpy.isDateInTodayToBeReturned = true
        
        let expectedResult = sut.format("2022-09-20T21:00:00Z")
        XCTAssertTrue(calendarSpy.isDateInTodayCalled)
        XCTAssertEqual(expectedResult, "Hoje, 18:09")
    }
    
    func test_format_whenDayIsYesterday_shouldReturnCorrectString() {
        calendarSpy.isDateInYesterdayToBeReturned = true
        
        let expectedResult = sut.format("2022-09-20T21:00:00Z")
        XCTAssertTrue(calendarSpy.isDateInYesterdayCalled)
        XCTAssertEqual(expectedResult, "Ter, 18:00")
    }
    
    func test_format_whenDayIsOtherDay_shouldReturnCorrectString() {
        let expectedResult = sut.format("2022-09-20T21:00:00Z")
        XCTAssertTrue(calendarSpy.isDateInYesterdayCalled)
        XCTAssertEqual(expectedResult, "20.09 18:00")
    }
}
