import UIKit

protocol ModuleFactoryProtocol {
    associatedtype Dependencies
    
    func make(with dependencies: Dependencies) -> UIViewController
}
