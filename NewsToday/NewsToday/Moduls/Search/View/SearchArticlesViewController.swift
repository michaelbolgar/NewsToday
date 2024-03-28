import UIKit

protocol SearchArticlesViewControllerProtocol: AnyObject {
    func reloadData()
}

final class SearchArticlesViewController: UIViewController, SearchArticlesViewControllerProtocol {

    //MARK: - Presenter
    var presenter: SearchArticlesPresenter!
    //MARK: - Private properties
    private let searchText: String
    private var articles: [Article] = []

    init(searchText: String) {
        self.searchText = searchText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UI Components
    private let tableView = UITableView()
    private let searchBar = SearchBarView()


    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        presenter = SearchArticlesPresenter(searchArticlesViewControllerProtocol: self)
        presenter.viewDidLoad()
        configureTableView()
        setupController()
        view.hideKeyboard()
        searchBar.delegate = self


    }

    //MARK: - Private methods
    private func setViews() {
        [searchBar, tableView].forEach {view.addSubview($0) }
    }
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchCell.self,
                           forCellReuseIdentifier: SearchCell.identifier)
    }


    private func setupController() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.height.equalTo(56)
            make.trailing.leading.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(5)
            make.trailing.leading.bottom.equalToSuperview()
       }
        title = "Results of the search query: \(searchText)"
        view.backgroundColor = .systemBackground
    }
}

extension SearchArticlesViewController: UITableViewDelegate, UITableViewDataSource {

    func reloadData() {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfArticles()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else { return UITableViewCell() }
        let article = presenter.getArticles(at: indexPath.row)
        cell.set(info: article)
            return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let article = presenter.getArticles(at: indexPath.row)

        guard let articleText = article.title else { return }
        NetworkManager.shared.fetchData(for: articleText) { result in
            switch result {
            case .success(let searchResults):
                DispatchQueue.main.async {
                    let vc = DetailsViewController()
                    vc.data = searchResults.articles
                    self.navigationController?.pushViewController(vc, animated: true)
                }

            case .failure(let error):
                print("Error fetching search results: \(error)")
            }
        }
    }
}

extension SearchArticlesViewController: SearchBarViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }

        NetworkManager.shared.fetchData(for: searchText) { result in
            switch result {
            case .success(let articles):
                self.presenter.searchArticles = articles.articles
                DispatchQueue.main.async {
                    self.presenter.viewDidLoad()
                    self.tableView.reloadData()
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
