import Foundation

extension String {
    var removeDotFromString: Self {
        replacingOccurrences(of: ".", with: "")
    }
}
