import UIKit

//TODO: привести к единому стилю

extension UIButton {
    static func makeButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.InterRegular(ofSize: 15)
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 320).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = UIColor.purplePrimary
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
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
