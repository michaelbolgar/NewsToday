import UIKit
import SnapKit

#warning("TODO: отрефакторить этот файл")

protocol CategoriesViewControllerProtocol: AnyObject {
    
}

final class CategoriesViewController: UIViewController {
    // MARK: - Presenter
    var presenter: CategoriesPresenterProtocol!
    
    // MARK: - Properties
    var categories = [Category]()
    // здесь хранятся выбранные категории
    let userDefaultsManager = UserDefaultsManager()
    
    var selectedCategories = [Category]()
    
    // MARK: - UI
    private let titleLabel = UILabel.makeLabel(text: "Categories",
                                               font: UIFont.InterSemiBold(ofSize: 24),
                                               textColor: UIColor.blackPrimary,
                                               numberOfLines: 1)
    
    private let subtitleLabel = UILabel.makeLabel(text:
                                                    "Thousands of articles in each category",
                                                  font: UIFont.InterRegular(ofSize: 16),
                                                  textColor: UIColor.greyPrimary,
                                                  numberOfLines: 1)
    
    private let horizontalStackView = UIStackView(axis: .horizontal)
    private let leftStackView = UIStackView(axis: .vertical)
    private let rightStackView = UIStackView(axis: .vertical)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        setupConstraints()
    
        presenter = CategoriesPresenter()
        categories = presenter.fetchСategories()
        
        restoreSelectedCategoriesFromUserDefaults()
        setupCategories()
    }
    
    // MARK: - Private funcs
    private func setupUI() {
        [titleLabel, subtitleLabel, horizontalStackView].forEach {view.addSubview($0) }
        [leftStackView,rightStackView].forEach{horizontalStackView.addArrangedSubview($0) }
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(72)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
    }
    private func setupCategories() {
        
          let halfIndex = categories.count / 2
          let leftCategories = Array(categories[..<halfIndex])
          let rightCategories = Array(categories[halfIndex...])
          
          setupStackView(leftStackView, with: leftCategories)
          setupStackView(rightStackView, with: rightCategories)
      }
    
    private func setupStackView(_ stackView: UIStackView, with categories: [Category]) {
        categories.forEach { category in
            
            let button = UIButton(initBackgroundColor: .greyLighter)
            
            button.setTitle("\(category.emoji) \(category.name)",
                            for: .normal)

            button.addTarget(self,
                             action: #selector(categoryTapped(_:)),
                             for: .touchUpInside)
            if selectedCategories.contains(where: { $0.name == category.name }) {
                button.backgroundColor = .purplePrimary // Цвет для выбранных категорий
                button.setTitleColor(.white, for: .normal)
            } else {
                button.backgroundColor = .greyLighter // Цвет для невыбранных категорий
                button.setTitleColor(.greyDark, for: .normal)
            }
            
            stackView.addArrangedSubview(button)
            
            button.snp.makeConstraints { make in
                make.height.lessThanOrEqualTo(72).priority(.high)
            }
        }
    }
    
    private func restoreSelectedCategoriesFromUserDefaults() {
        guard let savedCategoryNames = userDefaultsManager.getStringArray(forKey: .selectedCategories) else { return }
        
        selectedCategories = categories.filter { savedCategoryNames.contains($0.name) }
    }
    
    @objc private func categoryTapped(_ sender: UIButton) {
        
        let allButtons = leftStackView.arrangedSubviews + rightStackView.arrangedSubviews
        
        guard let index = allButtons.firstIndex(of: sender), index < categories.count else { return }

        let category = categories[index]
        
        if let selectedIndex = self.selectedCategories.firstIndex(where: { $0.id == category.id }) {
            
            UIView.animate(withDuration: 0.3) {
                sender.backgroundColor = .greyLighter
                sender.setTitleColor(.greyDark, for: .normal)
            }
            self.selectedCategories.remove(at: selectedIndex)
        } else {
            UIView.animate(withDuration: 0.3) {
                sender.backgroundColor = .purplePrimary
                sender.setTitleColor(.white, for: .normal)
            }
            self.selectedCategories.append(category)
        }
        let selectedCategoryNames = self.selectedCategories.map { $0.name }
        self.userDefaultsManager.set(selectedCategoryNames, forKey: .selectedCategories)
    }
}
