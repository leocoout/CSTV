import Foundation

extension Date {
    enum DateFormat: String {
        case yyyyMMddTHHmmssZ = "yyyy-MM-dd HH:mm:ss"
    }
    
    func getFormattedDate(format: DateFormat) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format.rawValue
        return dateformat.string(from: self)
    }
    
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    var calendar: Calendar { Calendar.current }

    var isInToday: Bool {
        calendar.isDateInToday(self)
    }

    var isInTomorrow: Bool {
        calendar.isDateInTomorrow(self)
    }
}
