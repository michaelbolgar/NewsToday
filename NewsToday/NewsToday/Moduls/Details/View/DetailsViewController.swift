import UIKit

protocol DetailsViewControllerProtocol: AnyObject {

}

final class DetailsViewController: UIViewController {

    //MARK: - Presenter
    var presenter: DetailsPresenterProtocol!

}
