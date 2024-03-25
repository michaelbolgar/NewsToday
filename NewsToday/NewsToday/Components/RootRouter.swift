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


    // Переместите методы за пределы start()

    private func showMainTabbar() -> UITabBarController {
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

//import UIKit
//
//final class RootRouter {
//
//    static let shared = RootRouter()
//
//    private var window: UIWindow?
//    private var factory: AppFactory
//
//    // Приватный инициализатор, чтобы предотвратить создание экземпляров класса извне
//    private init() {
//        self.window = nil
//        self.factory = Factory()
//    }
//
//    func configure(window: UIWindow?, factory: AppFactory) {
//        self.window = window
//        self.factory = factory
//    }
//
//    func start() {
//
//        //insert here code for dark/light mode if needed
//        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
//            window?.rootViewController = showOnboarding()
//        } else {
//            window?.rootViewController = showMainTabbar()
//        }
//        window?.makeKeyAndVisible()
//    }
//
//    func showMainTabbar() -> UITabBarController {
//        return factory.makeTabBar(
//            factory.makeHomeRouter().navigationController ?? UINavigationController(),
//            factory.makeCategoriesRouter().navigationController ?? UINavigationController(),
//            factory.makeBookmarksRouter().navigationController ?? UINavigationController(),
//            factory.makeProfileRouter().navigationController ?? UINavigationController()
//        )
//    }
//
//    func showOnboarding() -> UIViewController {
//        return factory.makeOnboardingViewController()
//    }
//}
