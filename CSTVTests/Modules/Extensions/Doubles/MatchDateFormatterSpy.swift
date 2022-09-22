@testable import CSTV

final class MatchDateFormatterSpy: MatchDateFormatterProtocol {
    
    private(set) var formatCalled: Bool = false
    private(set) var formatStrDatePassed: String?
    var formatToBeReturned: String?
    
    func format(_ strDate: String?) -> String? {
        formatCalled = true
        formatStrDatePassed = strDate
        return formatToBeReturned
    }
}
