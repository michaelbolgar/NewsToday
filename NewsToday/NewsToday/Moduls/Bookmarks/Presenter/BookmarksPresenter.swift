import UIKit

protocol BookmarksPresenterProtocol {
    var bookmarkCount: Int { get }
    func getBookmark(at index: Int) -> Bookmarks
    func viewDidLoad()
    func didEditingDelete(at indexPath: IndexPath)
}

final class BookmarksPresenter: BookmarksPresenterProtocol {
    weak private var bookmarksViewControllerProtocol: BookmarksViewControllerProtocol?
    
    var bookmarks: [Bookmarks] = []
    
    init(bookmarksViewControllerProtocol: BookmarksViewControllerProtocol? = nil) {
        self.bookmarksViewControllerProtocol = bookmarksViewControllerProtocol
    }
    
    var bookmarkCount: Int {
        return bookmarks.count
    }
    
    func getBookmark(at index: Int) -> Bookmarks {
        return bookmarks[index]
    }
    
    
    func viewDidLoad() {
        bookmarks = [Bookmarks(bookmarkImage: nil, categoryLabel: "UI/UX Design", textLabel: "A Simple Trick For Creating Color Palettes Quickly"),
                     Bookmarks(bookmarkImage: nil, categoryLabel: "UI/UX Design", textLabel: "A Simple Trick For Creating Color Palettes Quickly")
        ]
        
        bookmarksViewControllerProtocol?.reloadTableView()
    }
    
    func didEditingDelete(at indexPath: IndexPath) {
        bookmarks.remove(at: indexPath.row)
        bookmarksViewControllerProtocol?.reloadTableView()
}
}
