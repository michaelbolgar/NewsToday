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

        #warning("раз тут обращение через .bool, зачем нужен метод getBool? что там с примитивными типами данных?")
        let isLaunchedBefore = UserDefaults.standard.bool(forKey: Keys.isLaunchedBefore.rawValue)

        if isLaunchedBefore {
            print ("System message: Onboarding has already been launched, show Main Screen")
            window?.rootViewController = showMainTabbar()
        } else {
            print ("System message: This is the first launch, show Onboarding")
            window?.rootViewController = showOnboarding()
        }

        window?.makeKeyAndVisible()
    }

    func showMainTabbar() -> UITabBarController {
        return factory.makeTabBar(
            factory.makeHomeRouter().navigationController,
            factory.makeCategoriesRouter().navigationController,
            factory.makeBookmarksRouter().navigationController,
            factory.makeProfileRouter().navigationController
        )
    }

    func showOnboarding() -> UIViewController {
        UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
        return factory.makeOnboardingViewController()
    }
}
