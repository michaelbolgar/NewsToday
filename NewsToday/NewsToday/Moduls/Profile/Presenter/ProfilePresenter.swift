import UIKit

protocol ProfilePresenterProtocol {
    init(view: ProfileViewControllerProtocol, router: ProfileRouterProtocol)
    func showTermsVC()
    func showLanguagesVC()
    func showLoginVC()
}

final class ProfilePresenter: ProfilePresenterProtocol {

    private unowned var view: ProfileViewControllerProtocol
    private var router: ProfileRouterProtocol

    init(view: ProfileViewControllerProtocol, router: ProfileRouterProtocol) {
        self.view = view
        self.router = router
    }

    func showTermsVC() {
        router.showTermsVC()
    }

    func showLanguagesVC() {
        router.showLanguagesVC()
    }

    func showLoginVC() {
        router.showLoginVC()
    }
}
