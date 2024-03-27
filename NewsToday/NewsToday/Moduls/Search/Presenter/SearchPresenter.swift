//
//  SearchPresenter.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 24/03/24.
//

import UIKit

protocol SearchArticlesPresenterProtocol {
    func numberOfArticles() -> Int
    func getArticles(at index: Int) -> Article
    func viewDidLoad()
}

final class SearchArticlesPresenter: SearchArticlesPresenterProtocol {
    weak var searchArticlesViewControllerProtocol: SearchArticlesViewControllerProtocol?
    var searchArticles: [Article] = []

    init(searchArticlesViewControllerProtocol: SearchArticlesViewControllerProtocol? = nil) {
        self.searchArticlesViewControllerProtocol = searchArticlesViewControllerProtocol
    }

    func viewDidLoad() {

        searchArticlesViewControllerProtocol?.reloadData()
    }

    func numberOfArticles() -> Int {
        return searchArticles.count
    }

    func getArticles(at index: Int) -> Article {
        return searchArticles[index]
    }


}
