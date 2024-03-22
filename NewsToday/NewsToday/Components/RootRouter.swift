import UIKit

final class RootRouter {

    private let window: UIWindow?
    private let factory: AppFactory

    init(window: UIWindow?, factory: AppFactory) {
        self.window = window
        self.factory = factory
    }

    func start() {

        //insert here code for dark/light mode if needed

        window?.rootViewController = showMainTabbar()
        window?.makeKeyAndVisible()

    }

    func showMainTabbar() -> UITabBarController {
        return factory.makeTabBar(
            factory.makeHomeRouter().navigationController ?? UINavigationController(),
            factory.makeCategoriesRouter().navigationController ?? UINavigationController(),
            factory.makeBookmarksRouter().navigationController ?? UINavigationController(),
            factory.makeProfileRouter().navigationController ?? UINavigationController()
        )
    }
}
