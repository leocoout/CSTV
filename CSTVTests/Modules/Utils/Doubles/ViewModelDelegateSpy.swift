@testable import CSTV

final class ViewModelDelegateSpy: ViewModelDelegate {
    private(set) var willLoadCalled: Bool = false
    
    func willLoad() {
        willLoadCalled = true
    }
    
    private(set) var didLoadCalled: Bool = false
    
    func didLoad() {
        didLoadCalled = true
    }
}
