import UIKit

protocol ProfileViewControllerProtocol: AnyObject {

}

#warning("исправить следующие моменты:")
/*

1. присвоение цвета осуществляется через extension (см.папку Extensions), там есть цвет .greyLighter, который можно использовать по всему проекту. Таким образом, не надо будет постоянно писать цвет по rgb в коде + можно будет поменять этот цвет в два касания

 2. тексты кнопок должны быть реализованы через .makeLabel, не UITextView. Сейчас пользователь может стереть этот текст из кнопок

 3. картинки (стрелки, log out) лучше добавить в ассеты и вытягивать по имени. Это тоже обеспечит простой доступ и возможность легко изменить картинку по всему проекту

 4. добавление элементов на экран и констрейнты лучше разнести по разным функциям, например setupView() и setupConstraints(). Это будет соответствовать принципу разделения ответственности по SOLID

 5. большое количество элементов можно добавить на экран с помощью массива этих самых элементов и перебора, например: [label, label, view].forEach { view.addSubview($0) }

 6. поправить вёрстку под SE (запусти на симуляторе через SE, увидишь куда уехало). Адаптивный лэйаут строится на том, что мы задаём длину/ширину элементов и их расположение, отталкиваясь от safeAreaLayoutGuide (в данном случае можно начать размещать нижнюю кнопку от view.bottom. Мы не задаём ширину width, а прибиваем левый и правый края вью относительно основной вью:

 languageButton.snp.makeConstraints { make in
     make.leading.trailing.equalToSuperview().inset(20)
     make.top.equalTo(view.safeAreaLayoutGuide).inset(208)
     make.height.equalTo(56)
 }
 */


final class ProfileViewController: UIViewController {
    
    //MARK: - Presenter
    var presenter: ProfilePresenterProtocol!
    
    
    // MARK: - UI Elements
    
    private let languageButton: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let language: UITextView = {
        let element = UITextView()
        element.text = "Language"
        element.textColor = .darkGray
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.font = .InterRegular(ofSize: 16)
        return element
    }()
    
    private let rightAngleL: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Right angle")
        return element
    }()
    
    let profileTitle = UILabel.makeLabel(text: "Profile",
                                  font: UIFont.InterBold(ofSize: 24),
                                  textColor: .blackPrimary,
                                  numberOfLines: nil)
    
// переделать надпись профиль в UITextView
//    private let profileTitle: UITextView = {
//        let element = UITextView()
//        element.text = "Profile"
//        element.textColor = .blackPrimary
//        element.font = .InterBold(ofSize: 24)
//        return element
//    }()
    
    let pageTitle = UIView()
    
    private let profileImage: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Profile foto")
        element.layer.cornerRadius = 35
        element.clipsToBounds = true
        return element
    }()

    private let profileName: UITextView = {
        let element = UITextView()
        element.text = "Dev P"
        element.textColor = .blackPrimary
        element.font = .InterBold(ofSize: 16)
        return element
    }()
    
    private let profileEmail: UITextView = {
        let element = UITextView()
        element.text = "dev@gmail.com"
        element.textColor = .greyPrimary
        element.font = .InterRegular(ofSize: 14)
        return element
    }()
    
    private let termsButton: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let termsConditions: UITextView = {
        let element = UITextView()
        element.text = "Terms & Conditions"
        element.textColor = .darkGray
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.font = .InterRegular(ofSize: 16)
        return element
    }()
    
    private let rightAngleT: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Right angle")
        return element
    }()
    
    
    private let signoutButton: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let signOut: UITextView = {
        let element = UITextView()
        element.text = "Sign Out"
        element.textColor = .darkGray
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.font = .InterRegular(ofSize: 16)
        return element
    }()
    
    private let signOutLabel: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Sign Out")
        return element
    }()
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        //setupViews()
        
    }
    
    
    //MARK: Private Methods
    private func layout() {
        
        view.addSubview(languageButton)
        view.addSubview(profileTitle)
        view.addSubview(pageTitle)
        view.addSubview(profileImage)
        view.addSubview(profileName)
        view.addSubview(profileEmail)
        view.addSubview(language)
        view.addSubview(termsButton)
        view.addSubview(termsConditions)
        view.addSubview(signoutButton)
        view.addSubview(signOut)
        view.addSubview(rightAngleL)
        view.addSubview(rightAngleT)
        view.addSubview(signOutLabel)
        
        
        languageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(208)
            make.width.equalTo(336)
            make.height.equalTo(56)
        }
        
        profileTitle.snp.makeConstraints { make in
            make.top.equalTo(view).inset(72)
            make.left.equalTo(view).inset(20)
        }
        
        pageTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.left.equalTo(view).inset(20)
            make.width.equalTo(201)
            make.height.equalTo(136)
        }
        
        profileImage.snp.makeConstraints { make in
            make.left.equalTo(view).inset(20)
            make.top.equalTo(view).inset(136)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        
        profileName.snp.makeConstraints { make in
            make.left.equalTo(view).inset(116)
            make.top.equalTo(view).inset(148)
            make.width.equalTo(60)
            make.height.equalTo(24)
        }
        
        profileEmail.snp.makeConstraints { make in
            make.left.equalTo(view).inset(116)
            make.top.equalTo(view).inset(172)
            make.width.equalTo(115)
            make.height.equalTo(24)
        }
        
        language.snp.makeConstraints { make in
            make.left.equalTo(languageButton).inset(24)
            make.top.equalTo(languageButton).inset(10)
            make.width.equalTo(87)
            make.height.equalTo(30)
        }
        
        rightAngleL.snp.makeConstraints { make in
            make.right.equalTo(languageButton).inset(16)
            make.top.equalTo(languageButton).inset(12)
            make.width.equalTo(24)
            make.height.equalTo(30)
        }
        
        termsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view).inset(548)
            make.width.equalTo(336)
            make.height.equalTo(56)
        }
        
        termsConditions.snp.makeConstraints { make in
            make.left.equalTo(termsButton).inset(24)
            make.top.equalTo(termsButton).inset(10)
            make.width.equalTo(250)
            make.height.equalTo(30)
        }
        
        rightAngleT.snp.makeConstraints { make in
            make.right.equalTo(termsButton).inset(16)
            make.top.equalTo(termsButton).inset(12)
            make.width.equalTo(24)
            make.height.equalTo(30)
        }
        
        signoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view).inset(632)
            make.width.equalTo(336)
            make.height.equalTo(56)
        }
        
        signOut.snp.makeConstraints { make in
            make.left.equalTo(signoutButton).inset(24)
            make.top.equalTo(signoutButton).inset(10)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        signOutLabel.snp.makeConstraints { make in
            make.right.equalTo(signoutButton).inset(16)
            make.top.equalTo(signoutButton).inset(12)
            make.width.equalTo(24)
            make.height.equalTo(30)
        }
        
    }
}
