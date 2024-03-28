import UIKit
import SnapKit

final class SignInViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: - UI Elements
    private let welcomeLabel = UILabel.makeLabel(
        text: "Welcome Back 👋",
        font: UIFont.InterBold(ofSize: 25),
        textColor: UIColor.blackDark,
        numberOfLines: 0)
    
    private let hellotextLabel = UILabel.makeLabel(
        text: "I am happy to see you again. You can continue where you left off by logging in",
        font: UIFont.InterRegular(ofSize: 15),
        textColor: UIColor.greyLight,
        numberOfLines: 0)
    
    private let emailTextField = UITextField.makeTextField(
        placeholder: "Email Adress",
        textColor: UIColor.darkGray,
        font: UIFont.InterBold(ofSize: 15),
        imageSymbol: "envelope")
    
    private let passwordTextField = UITextField.makeTextField(
        placeholder: "Password",
        textColor: UIColor.darkText,
        font: UIFont.InterBold(ofSize: 15),
        imageSymbol: "lock")
    
    #warning("а не сделать ли через паддинг?")
    //контейнер для кнопки, чтобы сохранить отступы в textField
    private let symbolView: UIView = {
        let openCloseParol: UIButton = {
            let element = UIButton(type: .custom)
            element.setImage(UIImage(systemName: "eye"), for: .normal)
            element.frame = CGRect(x: 20, y: 10, width: 25, height: 25)
            element.addTarget(
                self,
                action: #selector(togglePasswordVisibility),
                for: .touchUpInside)
            return element
        }()
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(openCloseParol)
        return iconContainerView
    }()
    
    private let signInUIButton = UIButton.makeButton(text: "Sign In")
    
    #warning("заменить https://www.example.com")
    private let haveAccountTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Don`t have an account? Sign Up")
        attributedString.addAttribute(.link, value: "https://www.example.com", range: (attributedString.string as NSString).range(of: "Sign Up"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))
        
        let textView = UITextView()
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.textColor = UIColor.blackDark
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.delaysContentTouches = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCostraints()
        view.hideKeyboard()
    }
    
    // MARK: - Private Methods
    
    func setupView() {
        view.backgroundColor = .white
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = symbolView
        passwordTextField.rightViewMode = .always
        
        [welcomeLabel, hellotextLabel, emailTextField, passwordTextField, signInUIButton, haveAccountTextView].forEach { view.addSubview($0) }
        
    }
    // метод меняет цвет иконки, когда мы начинаем печатать
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            let blueColor = UIColor.systemBlue
            if let iconView = (textField.leftView as? UIView)?.subviews.first as? UIImageView {
                iconView.tintColor = updatedText.isEmpty ? .lightGray : blueColor
            }
        }
        return true
    }
    
    @objc func togglePasswordVisibility(sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
}
    // MARK: - Setup Constraints

extension SignInViewController {
    func setupCostraints() {
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        haveAccountTextView.delegate = self

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        hellotextLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel).inset(40)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(hellotextLabel).inset(70)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField).inset(65)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        signInUIButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField).inset(125)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        haveAccountTextView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}

    // MARK: - Preview Provider

//import SwiftUI
//
//struct StartViewProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().ignoresSafeArea()
//    }
//
//    struct ContainerView: UIViewRepresentable {
//        func makeUIView(context: Context) -> UIView {
//            let viewController = SignInViewController()
//            return viewController.view
//        }
//
//        func updateUIView(_ uiView: UIView, context: Context) { }
//    }
//}

