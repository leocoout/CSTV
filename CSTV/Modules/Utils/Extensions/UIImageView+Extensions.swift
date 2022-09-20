import Kingfisher
import UIKit
import Foundation

extension UIImageView {
    func loadImage(from url: String?) {
        guard let strUrl = url, let url = URL(string: strUrl) else {
            image = nil
            return
        }
        
        let resource = ImageResource(downloadURL: url)
        kf.setImage(with: resource)
    }
}
