import Foundation

extension Date {    
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
