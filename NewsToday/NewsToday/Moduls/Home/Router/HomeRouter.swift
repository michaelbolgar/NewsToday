import UIKit

// MARK: - HomeRouterProtocol

protocol HomeRouterProtocol: BaseRouter {
    func start()
    func showSearchVC()
    func showSeeAllVC()
    func showDetailsVC()
}

// MARK: HomeRouter

final class HomeRouter: HomeRouterProtocol {

    let navigationController: UINavigationController
    var moduleBuilder: (any HomeModuleBuilderProtocol)?
    private let factory: AppFactory

    init(navigationController: UINavigationController,
         factory: AppFactory,
         builder: HomeModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = builder
        self.factory = factory
    }

    func start() {
        navigationController.viewControllers = [factory.makeHomeViewController()]
    }

    func showSearchVC() {
        // нужно проверить работоспособность этой функции
        guard let searchVC = moduleBuilder?.createSearchVC() else { return }
        navigationController.pushViewController(searchVC, animated: true)
    }

    func showSeeAllVC() {
        //code
    }

    func showDetailsVC() {
        //code
    }
}
