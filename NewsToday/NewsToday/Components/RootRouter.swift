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

//        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
        if (3 != 2) {
            // Если приложение открывается впервые, отображаем OnboardingViewController
            window?.rootViewController = showOnboarding()
        } else {
            // Если приложение уже открывалось, отображаем HomeViewController
            window?.rootViewController = showMainTabbar()
        }

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

    func showOnboarding() -> UIViewController {
        return factory.makeOnboardingViewController()
    }
}
