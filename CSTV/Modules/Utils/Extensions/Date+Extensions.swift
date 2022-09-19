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
}
