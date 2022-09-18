protocol ViewModelDelegate: AnyObject {
    func willLoad()
    func didLoad()
}

protocol ViewModel {
    func initialize()
    var delegate: ViewModelDelegate? { get set }
}
