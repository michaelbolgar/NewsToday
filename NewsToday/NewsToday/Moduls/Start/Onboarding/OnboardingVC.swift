import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - UI Elements
  
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Const.itemSize
        layout.minimumLineSpacing = Const.itemSpacing
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false // Отключение индикатора прокрутки по горизонтали.
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true // Включение обрезки (clipping) содержимого коллекции по его границам.
        collectionView.register(
            myCollectionViewCell.self, forCellWithReuseIdentifier: "myCollectionViewCell") // Регистрация класса ячейки коллекции для повторного использования с указанным идентификатором.
        collectionView.isPagingEnabled = false
        //отделяет при скроле каждое фото отдельно или по одной полосой
        collectionView.contentInsetAdjustmentBehavior = .never //Отключение автоматической настройки внутренних отступов содержимого коллекции. Это позволяет предотвратить автоматическое добавление отступов для учета безопасной зоны (safe area).
        collectionView.contentInset = Const.collectionViewContentInset // Установка внутренних отступов содержимого коллекции с использованием заранее определенной константы collectionViewContentInset.
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.greyLight
        pageControl.currentPageIndicatorTintColor = UIColor.purplePrimary
        pageControl.currentPage = 0
        return pageControl
    }()
    
    private let onboardingLabel = UILabel.makeLabel(
        text: "First to know",
        font: UIFont.InterBold(ofSize: 20),
        textColor: UIColor.blackLight,
        numberOfLines: nil)
    
    private let onboardingInfoLabel = UILabel.makeLabel(
        text: "All news in one place, be the first to know last news",
        font: UIFont.InterRegular(ofSize: 15),
        textColor: UIColor.greyDark,
        numberOfLines: 2)
    
    private let nextButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Next", for: .normal)
        element.layer.cornerRadius = 10
        element.titleLabel?.font = UIFont.InterRegular(ofSize: 15)
        element.tintColor = .white
        element.widthAnchor.constraint(equalToConstant: 320).isActive = true
        element.heightAnchor.constraint(equalToConstant: 50).isActive = true
        element.backgroundColor = UIColor.purplePrimary
        return element
    }()
    
    // MARK: - Private Properties

    private let images = ["1.jpg", "2.jpg", "3.jpg"]
    
    private enum Const {
        static let itemSize = CGSize(width: 300, height: 400)
        static let itemSpacing = 24.0
        
        static var insetX: CGFloat {
            (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        
        static var collectionViewContentInset: UIEdgeInsets {
            UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    //MARK: Private Methods
    private func layout() {
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(onboardingLabel)
        view.addSubview(onboardingInfoLabel)
        view.addSubview(nextButton)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.numberOfPages = images.count
        onboardingInfoLabel.textAlignment = .center
        
        // MARK: - Setup Constraints
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20) // Adjust as needed
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Const.itemSize.height)
            make.centerX.equalToSuperview()// Adjust as needed
        }
        
        pageControl.numberOfPages = images.count // Set the total number of pages
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(onboardingLabel).inset(55) // Adjust as needed
        }
        
        onboardingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(onboardingInfoLabel).inset(75)
            make.centerX.equalToSuperview()
        }
        
        onboardingInfoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton).inset(125)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(25)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell

        cell.prepare(imageName: images[indexPath.item])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
}

// MARK: - UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / collectionView.frame.width)
                pageControl.currentPage = Int(pageIndex)
    }
}

// MARK: - Preview Provider

import SwiftUI

struct StartViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    
    struct ContainerView: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            let viewController = OnboardingViewController()
            return viewController.view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) { }
    }
}

