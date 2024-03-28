import UIKit
import SnapKit

protocol HomeViewControllerProtocol: AnyObject {

}

final class HomeViewController: UIViewController {

    //MARK: - Presenter
    var presenter: HomePresenterProtocol!

    //MARK: -> Properties
    private lazy var collectionView: UICollectionView = {
        let layout = self.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: -> Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        collectionViewRegister()
        view.hideKeyboard()
    }
    
    //MARK: -> Functions
    private func setViews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func collectionViewRegister() {
        collectionView.register(CategoriesCustomCell.self, forCellWithReuseIdentifier: CategoriesCustomCell.reuseIdentifier)
        collectionView.register(PopularCustomCell.self, forCellWithReuseIdentifier: PopularCustomCell.reuseIdentifier)
        collectionView.register(RecommendedCustomCell.self, forCellWithReuseIdentifier: RecommendedCustomCell.reuseIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.reuseIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendedCustomHeader.reuseIdentifier)
    }

    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
        guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }

            let section = self.createSection(sectionKind: sectionKind)
            return section
        }
        return layout
    }
    
    private func createItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 10)
        return item
    }
    
    private func createGroup(sectionKind: Section) -> NSCollectionLayoutGroup {
      
        let columns = sectionKind.columnCount
        let item = createItem()
        
        var groupHeight = NSCollectionLayoutDimension.fractionalWidth(1.0)
        var groupWidth = NSCollectionLayoutDimension.fractionalWidth(1.0)
        
        switch columns {
        case 4: groupHeight = NSCollectionLayoutDimension.absolute(40)
        case 2: groupHeight = NSCollectionLayoutDimension.absolute(250)
                groupWidth = NSCollectionLayoutDimension.absolute(500)
        default: groupHeight = NSCollectionLayoutDimension.absolute(100)
        }

        let groupSize = NSCollectionLayoutSize(
        widthDimension: groupWidth,
        heightDimension: groupHeight)
                   
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
        return group
    }
    
    private func createSection(sectionKind: Section) -> NSCollectionLayoutSection {
        let group = self.createGroup(sectionKind: sectionKind)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 20, leading: 16, bottom: 10, trailing: 16)
        
        if sectionKind == .categories {
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(180))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
            
        } else if sectionKind == .recommended {
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
        }
        
        if sectionKind == .categories || sectionKind == .popular {
            section.orthogonalScrollingBehavior = .continuous
        }
        return section
    }
}
//MARK: -> Extension
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Получение данных с бэка
         20
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
                  if indexPath.section == 0 {
                      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderView.reuseIdentifier, for: indexPath)
                      let customHeaderView = CustomHeaderView(frame: headerView.bounds)
                      headerView.addSubview(customHeaderView)
                      return headerView
                  } else if indexPath.section == 2 {
                      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendedCustomHeader.reuseIdentifier, for: indexPath)
                      let customHeaderView = RecommendedCustomHeader(frame: headerView.bounds)
                      headerView.addSubview(customHeaderView)
                      return headerView
                  }
              }
              return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCustomCell.reuseIdentifier,
                                                                for: indexPath) as? CategoriesCustomCell else {
                return UICollectionViewCell()
            }
            
            // TODO: Получение данных с бэка
            cell.configure(title: "Random")
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCustomCell.reuseIdentifier,
                                                                for: indexPath) as? PopularCustomCell else {
                return UICollectionViewCell()
            }
            
            // TODO: Получение данных с бэка
            cell.configure(imageName: "nnn", title: "POLITICS", text: "The latest situation in the presidential election")
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCustomCell.reuseIdentifier,
                                                                for: indexPath) as? RecommendedCustomCell else {
                return UICollectionViewCell()
            }
            
            // TODO: Получение данных с бэка
            cell.configure(model: RecommendedModel(imageName: "nnn", categoryName: "fhdkfj", titleText: "NNNNNNN"))
            return cell
        }
    }
}
