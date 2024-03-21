import UIKit

protocol CategoriesViewControllerProtocol: AnyObject {

}

final class CategoriesViewController: UIViewController {

    //MARK: - Presenter
    var presenter: CategoriesPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
    }
}
