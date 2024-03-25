import UIKit
final class RootRouter {
    
    private let window: UIWindow?
    private let factory: AppFactory
    
    init(window: UIWindow?, factory: AppFactory) {
        self.window = window
        self.factory = factory
    }
    
    func start() {
        // Если приложение открывается впервые, отображаем OnboardingViewController
        if !UserDefaultsManager.shared.hasLaunchedBefore {
            window?.rootViewController = showOnboarding()
        } else {
            // Если приложение уже открывалось, отображаем HomeViewController
            window?.rootViewController = showMainTabbar()
        }
        
        window?.makeKeyAndVisible()
        
    }
    
    
    // Переместите методы за пределы start()
    
    private func showMainTabbar() -> UITabBarController {
        return factory.makeTabBar(
            factory.makeHomeRouter().navigationController ?? UINavigationController(),
            factory.makeCategoriesRouter().navigationController ?? UINavigationController(),
            factory.makeBookmarksRouter().navigationController ?? UINavigationController(),
            factory.makeProfileRouter().navigationController ?? UINavigationController()
        )
    }
    
    private func showOnboarding() -> UIViewController {
        return factory.makeOnboardingViewController()
    }
}

