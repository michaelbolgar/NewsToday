//

import UIKit
protocol SearchArticlesViewControllerProtocol: AnyObject {
    func reloadData()
}

final class SearchArticlesViewController: UIViewController, SearchArticlesViewControllerProtocol {
    //MARK: - Presenter
    var presenter: SearchArticlesPresenter!
    //MARK: - Private properties
    let searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let tableView = UITableView()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter = SearchArticlesPresenter(searchArticlesViewControllerProtocol: self)
        presenter.viewDidLoad()
        configureTableView()
        setupController()
    }
    
    //MARK: - Public methods
    func configureTableView() {
        tableView.rowHeight = 96
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchCell.self,
                           forCellReuseIdentifier: SearchCell.identifier)
    }
    
  
    func setupController() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
                   make.edges.equalToSuperview()
       }
        title = "Results of the search query: \(searchText)"
    }
}

extension SearchArticlesViewController:
    UITableViewDelegate, UITableViewDataSource {
    
    func reloadData() {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else { return UITableViewCell() }
        let article = presenter.getArticles(at: indexPath.row)
        cell.set(info: article)
        
            return cell
    }
    
    
}
