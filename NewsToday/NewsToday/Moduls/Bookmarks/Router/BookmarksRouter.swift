import UIKit

protocol BookmarksRouterProtocol: BaseRouter {
    func start()
    func showDetailsVC()
}

final class BookmarksRouter: BaseRouter {

    let navigationController: UINavigationController
    var moduleBuilder: (any BookmarksModuleBuilderProtocol)?
    private let factory: AppFactory

    init(navigationController: UINavigationController, 
         factory: AppFactory,
         builder: BookmarksModuleBuilderProtocol)
    {
        self.navigationController = navigationController
        self.moduleBuilder = builder
        self.factory = factory
    }

    func start() {
        navigationController.viewControllers = [factory.makeBookmarksViewController()]
    }

    func showTermsVC() {
        // нужно проверить работоспособность этой функции
        guard let detailsVC = moduleBuilder?.createDetailsVC() else { return }
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
