import UIKit

protocol HomeViewControllerProtocol: AnyObject {

}

final class HomeViewController: UIViewController {

    //MARK: - Presenter
    var presenter: HomePresenterProtocol!

}
