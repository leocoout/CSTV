import Foundation

@testable import CSTV
    
final class CalendarSpy: CalendarProtocol {
    private(set) var isDateInTodayCalled: Bool = false
    private(set) var isDateInTodayDatePassed: Date?
    var isDateInTodayToBeReturned: Bool = false
    
    func isDateInToday(_ date: Date) -> Bool {
        isDateInTodayCalled = true
        isDateInTodayDatePassed = date
        return isDateInTodayToBeReturned
    }
    
    private(set) var isDateInYesterdayCalled: Bool = false
    private(set) var isDateInYesterdayDatePassed: Date?
    var isDateInYesterdayToBeReturned: Bool = false
    
    func isDateInYesterday(_ date: Date) -> Bool {
        isDateInYesterdayCalled = true
        isDateInYesterdayDatePassed = date
        return isDateInYesterdayToBeReturned
    }
}
