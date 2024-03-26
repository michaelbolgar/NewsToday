import Foundation

protocol CategoriesPresenterProtocol {
    func fetchСategories() -> [Category]
}

final class CategoriesPresenter: CategoriesPresenterProtocol {

    weak var view: CategoriesViewControllerProtocol?
    
    
    func fetchСategories()  -> [Category] {
        Categories.all
    }
}

