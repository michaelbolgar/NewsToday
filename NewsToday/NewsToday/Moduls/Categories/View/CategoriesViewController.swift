import UIKit
import SnapKit

protocol CategoriesViewControllerProtocol: AnyObject {

}

final class CategoriesViewController: UIViewController {
    //MARK: - Presenter
    
    var presenter: CategoriesPresenterProtocol!
    
    // MARK: - Properties
    var categories = [Category]()

    
    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        configureLayout(layout: layout)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setNavigationBar(title: "Categories")
        
        presenter = CategoriesPresenter()
        categories = presenter.fetchСategories()
        collectionView.reloadData()
    }
    
        // MARK: - private funcs
    private func configureLayout(layout: UICollectionViewFlowLayout)
    {
        let screenWidth = UIScreen.main.bounds.width
        let sectionInsets = UIEdgeInsets(top: 30, left: 15, bottom: 0, right: 15)
        let minItemSpacing: CGFloat = 15

    
        let availableWidth = screenWidth - sectionInsets.left - sectionInsets.right - minItemSpacing
        let itemWidth = availableWidth / 2

        layout.itemSize = CGSize(width: itemWidth, height: 72)
        layout.minimumInteritemSpacing = minItemSpacing
        layout.minimumLineSpacing = minItemSpacing
        layout.sectionInset = sectionInsets
    }
        private func setupUI(){
            view.addSubview(collectionView)
        }
    }
// MARK: - CategoriesViewController + setupConstraints
extension CategoriesViewController {
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - CategoriesViewController + UICollectionViewDataSource
extension CategoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath)
        as! CategoryCollectionViewCell
        
        cell.configure(with: categories[indexPath.item].name,
                       title: categories[indexPath.item].emoji)
        return cell
    }
}

// MARK: - CategoriesViewController + UICollectionViewDelegate
extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        
        cell.titleLabel.textColor = .white
        cell.contentView.backgroundColor = .purplePrimary
        
        //через Диспатч конечно так себе делать, но я запарился и не знаю как по другому, так как анимация смены фона и цвета текста срабатывает не одновременно, вариант сделать через таймер вместо async , но ну его нафиг :)  а еще ПашаДев меня за такое засмеял как то lol, но мне вес равно так как работает и хрен с ним
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.backgroundColor = .greyLighter
                cell.titleLabel.textColor = .darkGray
            })
        }
    }
}
