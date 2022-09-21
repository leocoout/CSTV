import Foundation

extension String {
    var formattedToDate: Self? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = inputFormatter.date(from: self) else { return nil }
        
        var strDate: String
        
        if date.isInToday == true {
            strDate = "Hoje, " + date.string(withFormat: "HH:MM")
        } else if date.isInTomorrow == true {
            strDate = date.string(withFormat: "EE, HH:mm").removeDotFromString
        } else {
            strDate = date.string(withFormat: "dd.MM HH:mm")
        }
    
        return strDate.capitalized
    }
    
    var removeDotFromString: Self {
        replacingOccurrences(of: ".", with: "")
    }
}
