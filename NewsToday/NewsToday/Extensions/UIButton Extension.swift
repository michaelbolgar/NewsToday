import UIKit

extension UIButton {
    
    convenience init(initBackgroundColor: UIColor) {
        
        self.init(type: .custom)
        
        setTitleColor(.greyDark, for: .normal)
        backgroundColor = initBackgroundColor
        titleLabel?.font = .InterSemiBold(ofSize: 20)
        layer.cornerRadius = 12
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderColor = UIColor.greyLight.cgColor
        layer.masksToBounds = true
    }
}
