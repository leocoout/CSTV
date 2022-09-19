import Kingfisher
import UIKit
import Foundation

extension UIImageView {
    func loadImage(from url: String) {
        guard let url = URL(string: url) else {
            image = nil
            return
        }
        
        let resource = ImageResource(downloadURL: url)
        kf.setImage(with: resource)
    }
}
