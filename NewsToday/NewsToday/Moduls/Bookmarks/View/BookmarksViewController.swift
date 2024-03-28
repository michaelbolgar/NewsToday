import UIKit
import SnapKit

protocol BookmarksViewControllerProtocol: AnyObject {
    func reloadTableView()
}

final class BookmarksViewController: UIViewController, BookmarksViewControllerProtocol {

    //MARK: - Presenter
    var presenter: BookmarksPresenterProtocol!

    //MARK: - UI Components
    private let tableView = UITableView()

    private let titleLabelBig = UILabel.makeLabel(text: "Bookmarks",
                                                  font: UIFont.InterSemiBold(ofSize: 24),
                                                  textColor: UIColor.blackPrimary,
                                                  numberOfLines: 1)

    private let titleLabelSmall = UILabel.makeLabel(text: "Saved articles to the library", 
                                                    font: UIFont.InterRegular(ofSize: 16),
                                                    textColor: UIColor.greyPrimary,
                                                    numberOfLines: 1)

    private let emptyView = EmptyView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter = BookmarksPresenter(bookmarksViewControllerProtocol: self)
        presenter.viewDidLoad()
        configureTableView()
        setupViews()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
//        emptyView.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
   //     getFavorites()
    }
    
//    func getFavorites() {
//        PersistenceManager.retrieveFavorites { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let favorites):
//                self.presenter.bookmarks = favorites
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                    self.updateEmptyViewVisibility()
//                    self.view.bringSubviewToFront(self.tableView) // just in case the empty view is on top of the table view
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

    //MARK: - Public Methods
    
    func updateEmptyViewVisibility() {
            emptyView.isHidden = presenter.bookmarkCount > 0
        }
    
    func configureTableView() {
        tableView.rowHeight = 96
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookmarkCell.self, forCellReuseIdentifier: BookmarkCell.reuseID)
    }
    
    func setupViews() {
        [titleLabelBig, titleLabelSmall, tableView, emptyView].forEach {view.addSubview($0) }
    }
}


extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func reloadTableView() {
        tableView.reloadData()
        updateEmptyViewVisibility()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.bookmarkCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkCell.reuseID) as! BookmarkCell
       let bookmark = presenter.getBookmark(at: indexPath.row)
        cell.set(info: bookmark)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.didEditingDelete(at: indexPath)
        }
    }

}


extension BookmarksViewController {
    func setupConstraints() {
            titleLabelBig.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(72)
        }
        titleLabelSmall.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(112)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        emptyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
