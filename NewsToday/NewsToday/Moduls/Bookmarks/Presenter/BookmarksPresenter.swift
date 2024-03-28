import UIKit

protocol BookmarksPresenterProtocol {
    var bookmarkCount: Int { get }
    func getBookmark(at index: Int) -> Article
    func viewDidLoad()
    func didEditingDelete(at indexPath: IndexPath)
    func retrieveBookmarks()
}

final class BookmarksPresenter: BookmarksPresenterProtocol {
    weak private var bookmarksViewControllerProtocol: BookmarksViewControllerProtocol?
    
    var bookmarks: [Article] = []
    
    init(bookmarksViewControllerProtocol: BookmarksViewControllerProtocol? = nil) {
        self.bookmarksViewControllerProtocol = bookmarksViewControllerProtocol
    }
    
    var bookmarkCount: Int {
        return bookmarks.count
    }
    
    func getBookmark(at index: Int) -> Article {
        return bookmarks[index]
    }
    
    
    func viewDidLoad() {
        bookmarksViewControllerProtocol?.reloadTableView()
        retrieveBookmarks()
    }

    func didEditingDelete(at indexPath: IndexPath) {
        bookmarks.remove(at: indexPath.row)
        bookmarksViewControllerProtocol?.reloadTableView()
    }
    
    func retrieveBookmarks() {
         // Retrieve bookmarks from persistence manager
         PersistenceManager.retrieveFavorites { [weak self] result in
             guard let self = self else { return }
             switch result {
             case .success(let favorites):
                 self.bookmarks = favorites
                 self.bookmarksViewControllerProtocol?.reloadTableView()
             case .failure(let error):
                 print(error)
             }
         }
     }
}
