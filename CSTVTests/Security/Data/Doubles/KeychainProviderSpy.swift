@testable import CSTV

final class KeychainProviderSpy: KeychainProviderProtocol {
    
    private(set) var setCalled: Bool = false
    private(set) var setStringPassed: String?
    private(set) var setKeyPassed: String?
    
    func set(_ string: String, forKey key: String) throws {
        setCalled = true
        setStringPassed = string
        setKeyPassed = key
    }
    
    private(set) var stringCalled: Bool = false
    private(set) var stringKeyPassed: String?
    var stringToBeReturned: String?
    
    func string(forKey key: String) throws -> String {
        stringCalled = true
        stringKeyPassed = key
        if let  stringToBeReturned {
            return  stringToBeReturned
        }
        
        throw GenericError.dummy
    }
    
    enum GenericError: Error {
        case dummy
    }
}
