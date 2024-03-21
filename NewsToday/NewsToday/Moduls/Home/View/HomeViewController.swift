import UIKit

protocol HomeViewControllerProtocol: AnyObject {

}

final class HomeViewController: UIViewController {

    //MARK: - Presenter
    var presenter: HomePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }

}
