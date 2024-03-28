//import UIKit
//
//// MARK: ProfileModuleBuilderProtocol
//
//protocol CategoriesModuleBuilderProtocol {
//    func createCategoriesModule(router: BaseRouter) -> UIViewController
//}
//
//// MARK: Profile Builder
//
//final class CategoriesModuleBuilder: CategoriesModuleBuilderProtocol {
//
//    func createCategoriesModule(router: BaseRouter) -> UIViewController {
//        let view = CategoriesViewController()
//        let presenter = CategoriesPresenter(view: view as! CategoriesViewControllerProtocol, router: router as! CategoriesRouterProtocol)
//        view.presenter = presenter
//        return view
//    }
//}


