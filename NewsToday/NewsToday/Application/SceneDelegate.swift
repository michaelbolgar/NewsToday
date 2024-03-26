import UIKit

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//    let factory: AppFactory = Factory()
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        let rootRouter = factory.makeRootRouter(window!)
//        rootRouter.start()
//    }
//}

//загрузка ViewController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = ViewController()
//        window.makeKeyAndVisible()
//        self.window = window
//    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return }
        let window = UIWindow(windowScene: windowScene)
 
        let navigationController = UINavigationController(rootViewController: SearchArticlesViewController(searchText: "Hello"))
        window.rootViewController = navigationController
        
   
        
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}
