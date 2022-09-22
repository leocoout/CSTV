import Foundation

extension Date {
    static func fixture() -> Self {
        let isoDate = "2016-04-14T10:44:00+0000"
        let dateFormatter = ISO8601DateFormatter()
        
        return dateFormatter.date(from:isoDate) ?? Date()
    }
}
