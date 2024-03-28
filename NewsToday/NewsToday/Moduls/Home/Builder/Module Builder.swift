import UIKit

// MARK: HomeModuleBuilderProtocol

protocol HomeModuleBuilderProtocol {
    func createHomeModule(router: BaseRouter) -> UIViewController
    func createSearchVC() -> UIViewController
    func createSeeAllVC() -> UIViewController
    func createDetailsVC() -> UIViewController
}

// MARK: Home Builder

final class HomeModuleBuilder: HomeModuleBuilderProtocol {

    func createHomeModule(router: BaseRouter) -> UIViewController {
        let view = HomeViewController()
//        let router = HomeRouterProtocol
        let presenter = HomePresenter(view: view as HomeViewControllerProtocol, router: router as! any HomeRouterProtocol as HomeRouterProtocol)
        view.presenter = presenter
        return view
    }

    func createSearchVC() -> UIViewController {
        //создать нужный VC, пока поставил заглушку чтобы не алярмило
        DetailsViewController()
    }

    func createSeeAllVC() -> UIViewController {
        //создать нужный VC, пока поставил заглушку чтобы не алярмило
        DetailsViewController()
    }

    func createDetailsVC() -> UIViewController {
        DetailsViewController()
    }
}
