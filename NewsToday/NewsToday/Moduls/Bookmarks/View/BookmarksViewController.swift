import UIKit

protocol BookmarksViewControllerProtocol: AnyObject {

}

final class BookmarksViewController: UIViewController {

    //MARK: - Presenter
    var presenter: BookmarksPresenterProtocol!

}
