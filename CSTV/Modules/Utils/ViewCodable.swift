protocol ViewCodable {
    func setup()
    func setupSubviews()
    func setupConstraints()
    func setupExtraConfigurations()
}

extension ViewCodable {
    func setup() {
        setupSubviews()
        setupConstraints()
        setupExtraConfigurations()
    }
    
    func setupExtraConfigurations() {}
}
