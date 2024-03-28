import UIKit

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

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = SignUpViewController()
//        window.makeKeyAndVisible()
//        self.window = window
//    }
//}


//загрузка ViewController

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = SearchArticlesViewController(searchText: "apple")
//        window.makeKeyAndVisible()
//        self.window = window
//    }
//}
