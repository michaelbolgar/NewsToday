import UIKit

extension UIStackView {
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        spacing: CGFloat = 10,
        alignment: UIStackView.Alignment = .center
    ){
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alignment
    }
}
