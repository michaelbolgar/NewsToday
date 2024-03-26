import UIKit
import SnapKit

protocol CategoriesViewControllerProtocol: AnyObject {

}

final class CategoriesViewController: UIViewController {
    // MARK: - Presenter
    var presenter: CategoriesPresenterProtocol!
    
    // MARK: - Properties
    var categories = [Category]()
    
    // MARK: - UI
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setNavigationBar(title: "Categories")
        
        presenter = CategoriesPresenter()
        categories = presenter.fetchСategories()
        setupCategories()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.addSubview(stackView)
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
    
    private func setupCategories() {
        categories.forEach { category in
            let button = UIButton(type: .system)
            button.setTitle("\(category.emoji) \(category.name)", for: .normal)
            button.setTitleColor(.greyDark, for: .normal)
            
            button.backgroundColor = .greyLighter
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func categoryTapped(_ sender: UIButton) {
        sender.setTitleColor(.white, for: .selected)
        print("Category tapped")
    }
}
