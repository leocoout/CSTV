import Foundation

protocol CalendarProtocol {
    func isDateInToday(_ date: Date) -> Bool
    func isDateInYesterday(_ date: Date) -> Bool
}

extension Calendar: CalendarProtocol {}

extension Date {
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
