import UIKit

extension UIView {
    func addCornerRadius(of size: CGFloat, corners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = size
        layer.maskedCorners = corners
    }
}
