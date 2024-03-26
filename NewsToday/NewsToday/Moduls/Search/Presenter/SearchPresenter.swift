//
//  SearchPresenter.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 24/03/24.
//

import UIKit

protocol SearchArticlesPresenterProtocol {
    func viewDidLoad()
    func numberOfArticles() -> Int
    func getArticles(at index: Int) -> Search
    func didSelectArticle(at indexPath: IndexPath)
}

final class SearchArticlesPresenter: SearchArticlesPresenterProtocol {
    weak var searchArticlesViewControllerProtocol: SearchArticlesViewControllerProtocol?
    var searchArticles: [Search] = []
    
    init(searchArticlesViewControllerProtocol: SearchArticlesViewControllerProtocol? = nil) {
        self.searchArticlesViewControllerProtocol = searchArticlesViewControllerProtocol
    }
    
    func viewDidLoad() {
        searchArticles = [Search(searchImage: nil,
                                 textSearchLabel: "Important News",
                                 textLabel: "A Simple Trick For Creating Color Palettes Quickly")]
        searchArticlesViewControllerProtocol?.reloadData()
    }
    
    func numberOfArticles() -> Int {
        return searchArticles.count
    }
    
    func getArticles(at index: Int) -> Search {
        return searchArticles[index]
    }
    
    func didSelectArticle(at indexPath: IndexPath) {
       //shows DetailcVC
    }
}
