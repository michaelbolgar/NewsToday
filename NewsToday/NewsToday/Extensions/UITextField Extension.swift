import UIKit

extension UITextField {
    static func makeTextField(placeholder: String, textColor: UIColor, font: UIFont?, imageSymbol: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .left
        textField.backgroundColor = UIColor.greyLighter
        textField.layer.cornerRadius = 10
        textField.snp.makeConstraints { make in make.height.equalTo(50) }
        textField.font = font
        textField.textColor = textColor
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none

        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        iconView.image = UIImage(systemName: imageSymbol)
        iconView.contentMode = .scaleAspectFit
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(iconView)
        
        textField.leftView = iconContainerView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}

