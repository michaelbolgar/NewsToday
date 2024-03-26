import UIKit

// MARK: BookmarksModuleBuilderProtocol

protocol BookmarksModuleBuilderProtocol {
    func createBookmarksModule(router: BaseRouter) -> UIViewController
    func createDetailsVC() -> UIViewController
}

// MARK: Profile Builder

final class BookmarksModuleBuilder: BookmarksModuleBuilderProtocol {

    func createBookmarksModule(router: BaseRouter) -> UIViewController {
        let view = BookmarksViewController()
        let presenter = BookmarksPresenter()
        view.presenter = presenter
        return view
    }

    func createDetailsVC() -> UIViewController {
        // создать экран для terms, строка ниже = заглушка чтобы не лезли ошибки
        DetailsViewController()
    }
}
