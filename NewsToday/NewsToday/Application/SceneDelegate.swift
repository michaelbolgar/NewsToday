import UIKit

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//    let factory: AppFactory = Factory()
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//
//        let rootViewController: UIViewController
//
//        // Проверяем значение в UserDefaults
//        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
//            // Если приложение открывается впервые, отображаем OnboardingViewController
//            rootViewController = factory.makeOnboardingViewController()
//        } else {
//            // Если приложение уже открывалось, отображаем HomeViewController
//            rootViewController = factory.makeHomeViewController()
//        }
//        window?.rootViewController = rootViewController
//        window?.makeKeyAndVisible()
//    }
//}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let factory: AppFactory = Factory()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootRouter = factory.makeRootRouter(window!)
        rootRouter.start()
    }
}


//загрузка ViewController
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = ViewController()
//        window.makeKeyAndVisible()
//        self.window = window
//    }
//    
//}



