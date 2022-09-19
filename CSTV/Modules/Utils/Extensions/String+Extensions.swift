import Foundation

extension String {
    func formatToDate() -> Self {
        let getFormatter = DateFormatter()
        getFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EE, HH:mm"
        
        let date = getFormatter.date(from: self) ?? Date()
        let stringFromDate = outputFormatter.string(from: date)
        
        return stringFromDate.replacingOccurrences(of: ".", with: "").capitalized
    }
}
