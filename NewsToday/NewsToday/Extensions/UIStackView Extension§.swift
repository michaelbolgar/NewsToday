import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis){
        self.init()
        
        self.axis = axis
        self.distribution = .fillEqually
        self.spacing = 10
        self.alignment = .fill
    }
}
