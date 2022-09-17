import SimpleKeychain

protocol KeychainProviderProtocol {
    func set(_ string: String, forKey key: String) throws
    func string(forKey key: String) throws -> String
}

extension SimpleKeychain: KeychainProviderProtocol {}
