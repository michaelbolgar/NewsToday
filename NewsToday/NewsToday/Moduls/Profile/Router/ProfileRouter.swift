import UIKit

// MARK: - ProfileRouterProtocol

protocol ProfileRouterProtocol: BaseRouter {
    func start()
    func showTermsVC()
    func showLanguagesVC()
    func showLoginVC()
}

final class ProfileRouter: ProfileRouterProtocol {
    var navigationController: UINavigationController

    var moduleBuilder: (any ProfileModuleBuilderProtocol)?

    private let factory: AppFactory

    init(navigationController: UINavigationController, factory: AppFactory, builder: ProfileModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.factory = factory
        self.moduleBuilder = builder
    }

    func start() {
        navigationController.viewControllers = [factory.makeProfileViewController()]
    }

    func showTermsVC() {
        // нужно проверить работоспособность этой функции
        guard let termsVC = moduleBuilder?.createTermsVC() else { return }
        navigationController.pushViewController(termsVC, animated: true)
    }

    func showLanguagesVC() {
        // вставить код по аналогии с функцией выше
    }

    func showLoginVC() {
        // вставить код по аналогии с функцией выше
    }
}
