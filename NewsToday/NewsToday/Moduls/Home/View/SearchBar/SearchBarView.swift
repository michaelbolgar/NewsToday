import UIKit

final class SearchBarView: UIView {
    weak var delegate: SearchBarViewDelegate?
    var searchIcon: String = "magnifyingglass"

    // MARK: - UI Properties
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        let image = UIImage(systemName: searchIcon)?.withTintColor(.clear, renderingMode: .alwaysOriginal)
        search.setImage(image, for: .search, state: .normal)
        search.delegate = self
        search.barTintColor = nil
        search.tintColor = .greyLight
        search.searchTextPositionAdjustment = UIOffset(horizontal: 5, vertical: 0)
        search.searchTextField.placeholder = "Search"
        search.searchTextField.textColor = .greyLight
        search.backgroundColor = .clear
        return search
    }()

    private lazy var searchButton: UIButton = {
        let image = UIImage(systemName: searchIcon)
        let action = UIAction(image: image, handler: searchAction)
        let button = UIButton(type: .system, primaryAction: action)
        button.isEnabled = false
        return button
    }()

    // MARK: - Initializators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Private Methods
    private func setView() {
        addSubview(searchBar)
        searchBar.addSubview(searchButton)
    }

    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        searchButton.snp.makeConstraints {
            $0.top.leading.equalTo(searchBar.searchTextField).inset(5)
        }
    }

    // MARK: - Private Methods
    private func searchAction(_ action: UIAction) {
        searchBarSearchButtonClicked(searchBar)
    }

    // MARK: - Internal Methods
    func toggleSearchButton(with value: Bool) {
        searchButton.isEnabled = value
    }
}
