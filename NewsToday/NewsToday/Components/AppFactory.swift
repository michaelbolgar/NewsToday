import UIKit

protocol BaseRouter: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
    func back()
    func popToRoot()
}

extension BaseRouter {
    func back() {
        navigationController.popViewController(animated: true)
    }

    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}

protocol AppFactory: AnyObject {

    func makeRootRouter(_ window: UIWindow?) -> RootRouter
    func makeTabBar(_ viewControllers: UIViewController...) -> UITabBarController
    
    func makeOnboardingViewController() -> UIViewController
    func makeHomeViewController() -> UIViewController
    func makeCategoriesViewController() -> UIViewController
    func makeBookmarksViewController() -> UIViewController
    func makeProfileViewController() -> UIViewController

    func makeOnboardingRouter() -> BaseRouter
    func makeHomeRouter() -> BaseRouter
    func makeCategoriesRouter() -> BaseRouter
    func makeBookmarksRouter() -> BaseRouter
    func makeProfileRouter() -> BaseRouter

}

final class Factory: AppFactory {
  
    func makeRootRouter(_ window: UIWindow?) -> RootRouter {
        RootRouter(window: window, factory: self)
    }
    
    func makeTabBar(_ viewControllers: UIViewController...) -> UITabBarController {
        let tabBar = MainTabBarController()
        tabBar.viewControllers = viewControllers
        return tabBar
    }
    
    func makeOnboardingViewController() -> UIViewController {
        OnboardingViewController()
    }
    
    func makeHomeViewController() -> UIViewController {
        HomeViewController()
    }
    
    func makeCategoriesViewController() -> UIViewController {
        CategoriesViewController()
    }
    
    func makeBookmarksViewController() -> UIViewController {
        BookmarksViewController()
    }
    
    func makeProfileViewController() -> UIViewController {
        SignInViewController()
    }
    
    func makeOnboardingRouter() -> BaseRouter {
        let navController = UINavigationController()
        let router = OnboardingRouter(navigationController: navController, factory: self)
        router.start()
        return router
    }

    func makeHomeRouter() -> BaseRouter {
        let navController = UINavigationController()
        navController.configureTabBarItem("home")
        let moduleBuilder = HomeModuleBuilder()
        let router = HomeRouter(navigationController: navController, factory: self, builder: moduleBuilder)
        router.start()
        return router
    }
    
    func makeCategoriesRouter() -> BaseRouter {
        let navController = UINavigationController()
        navController.configureTabBarItem("categories")
        let router = CategoriesRouter(navigationController: navController, factory: self)
        router.start()
        return router
    }
    
    func makeBookmarksRouter() -> BaseRouter {
        let navController = UINavigationController()
        navController.configureTabBarItem("bookmarks")
        let router = BookmarksRouter(navigationController: navController, factory: self)
        router.start()
        return router
    }
    
    func makeProfileRouter() -> BaseRouter {
        let navController = UINavigationController()
        navController.configureTabBarItem("profile")
        let router = ProfileRouter(navigationController: navController, factory: self)
        router.start()
        return router
    }
}
