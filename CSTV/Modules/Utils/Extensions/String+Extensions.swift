import Foundation

extension String {
    func formatToDate() -> Self {
        let getFormatter = DateFormatter()
        getFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let outputFormatter = DateFormatter()
        outputFormatter.timeZone = TimeZone(abbreviation: "GMT")
        outputFormatter.dateFormat = "EE, HH:mm"
        
        let date = getFormatter.date(from: self) ?? Date()
        let stringFromDate = outputFormatter.string(from: date)
        
        return stringFromDate.replacingOccurrences(of: ".", with: "").capitalized
    }
}
