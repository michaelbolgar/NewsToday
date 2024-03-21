import UIKit
import SnapKit

protocol CategoriesViewControllerProtocol: AnyObject {

}

final class CategoriesViewController: UIViewController {
    
    //MARK: - Presenter
    var presenter: CategoriesPresenterProtocol!
    
    // MARK: - Properties
    let categories = [
        ("Business", "💼"),
        ("Entertainment", "🎭"),
        ("General", "🌐"),
        ("Health", "🩺"),
        ("Science", "🔬"),
        ("Sports", "🏅"),
        ("Technology", "💻"),
      ]
    
    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 180, height: 72)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white

        return collectionView
      }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setNavigationBar(title: "Categories")
    }
    
    // MARK: - private funcs
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
extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath)
        as! CategoryCollectionViewCell
        
        let category = categories[indexPath.item]
        cell.configure(with: category.1, title: category.0)
        return cell
    }
}

