import Foundation

protocol MatchDateFormatterProtocol {
    func format(_ strDate: String?) -> String?
}

final class MatchDateFormatter: MatchDateFormatterProtocol {
    private let calendar: CalendarProtocol
    
    init(calendar: CalendarProtocol = Calendar.current) {
        self.calendar = calendar
    }
    
    func format(_ str: String?) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let str, let date = inputFormatter.date(from: str) else { return nil }
        
        var strDate: String
        
        if calendar.isDateInToday(date) == true {
            strDate = "Hoje, " + date.string(withFormat: "HH:MM")
        } else if calendar.isDateInYesterday(date) == true {
            strDate = date.string(withFormat: "EE, HH:mm").removeDotFromString
        } else {
            strDate = date.string(withFormat: "dd.MM HH:mm")
        }
    
        return strDate.capitalized
    }
}
