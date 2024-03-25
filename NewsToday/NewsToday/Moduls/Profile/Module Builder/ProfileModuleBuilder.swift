import UIKit

// MARK: ProfileModuleBuilderProtocol

protocol ProfileModuleBuilderProtocol {
    func createProfileModule(router: BaseRouter) -> UIViewController
    func createTermsVC() -> UIViewController
    func createLanguagesVC() -> UIViewController
}

// MARK: Profile Builder

final class ProfileModuleBuilder: ProfileModuleBuilderProtocol {

    func createProfileModule(router: BaseRouter) -> UIViewController {
        let view = ProfileViewController()
        let presenter = ProfilePresenter(view: view as! ProfileViewControllerProtocol, router: router as! ProfileRouterProtocol)
        view.presenter = presenter
        return view
    }
    
    func createTermsVC() -> UIViewController {
        // создать экран для terms, строка ниже = заглушка чтобы не лезли ошибки
        ProfileViewController()
    }
    
    func createLanguagesVC() -> UIViewController {
        // создать экран для языков, строка ниже = заглушка чтобы не лезли ошибки
        ProfileViewController()
    }
}
