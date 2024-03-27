import UIKit

protocol HomePresenterProtocol {
    func getCategoryArrayCount() -> Int
    func getArticleArrayCount() -> Int
    func getCategory(at index: IndexPath) -> String
    func getArticle(at index: IndexPath) -> Article
    func topHeadlinesTest(category: String)
}

final class HomePresenter: HomePresenterProtocol {

    weak private var homeViewController: HomeViewControllerProtocol?
    
    var bookmarks: [Bookmarks] = []
    
    init(homeViewController: HomeViewControllerProtocol? = nil) {
        self.homeViewController = homeViewController
    }
    
    var categoryArray = [
        "business",
        "entertainment",
        "general",
        "health",
        "science",
        "sports",
        "technology"
    ]
    
    var articleArray = [Article(source: Source(id: "fewe", name: "vrf"), author: "vfdf", title: "fdfdf", description: "fdfdfdf", url: "fdfe", urlToImage: "fdfer", publishedAt: "fer", content: "fderer")]
    
    
    func getCategoryArrayCount() -> Int {
        categoryArray.count
    }
    
    func getArticleArrayCount() -> Int {
        articleArray.count
    }
    
    func getCategory(at index: IndexPath) -> String {
         categoryArray[index.row]
    }
    
    func getArticle(at index: IndexPath) -> Article {
         articleArray[index.row]
    }
    
    func topHeadlinesTest(category: String) { NetworkManager.shared.fetchTopHeadlines(category: category) { result in
            switch result {
            case .success(let category):
                self.articleArray = category.articles
                DispatchQueue.main.async {
                    self.homeViewController?.reloadCollectionView()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
