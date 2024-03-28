import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Private&Static Properties
    
    var onboardingRouter: OnboardingRouter?
    
    static let images = ["1.jpg", "2.jpg", "3.jpg"]
    
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
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = Const.collectionViewContentInset
        collectionView.decelerationRate = .fast

        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.isPagingEnabled = false
        collectionView.contentInsetAdjustmentBehavior = .never

        #warning("переписать идентификатор")
        collectionView.register(myCollectionViewCell.self,
                                forCellWithReuseIdentifier: "myCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.greyLight
        pageControl.currentPageIndicatorTintColor = UIColor.purplePrimary
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        return pageControl
    }()
    
    private let onboardingLabel = UILabel.makeLabel(text: "Read by category",
                                                    font: UIFont.InterBold(ofSize: 20),
                                                    textColor: UIColor.blackLight,
                                                    numberOfLines: nil)
    
    private let onboardingInfoLabel = UILabel.makeLabel(text:
                                                            "All news in one place, be the first to know last news",
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
        element.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        
        view.backgroundColor = .white

        [collectionView, pageControl, onboardingLabel, onboardingInfoLabel, nextButton].forEach { view.addSubview($0) }

        onboardingInfoLabel.textAlignment = .center
    }

    @objc func pushButtonTapped(){
//        guard let onboardingRouter = onboardingRouter else {
//               print("Onboarding router is nil")
//               return
//           }
        let nextPage = min(pageControl.currentPage + 1, OnboardingViewController.images.count - 1)
        let targetOffsetX = CGFloat(nextPage) * (Const.itemSize.width + Const.itemSpacing) - collectionView.contentInset.left
        collectionView.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: true)
        
        switch onboardingLabel.text {
        case "Read by category":
            onboardingLabel.text = "Select your favorite topics"
        case "Select your favorite topics":
            onboardingLabel.text = "Save articles to your library"
            nextButton.setTitle("Get Started", for: .normal)
        default:
            onboardingRouter?.start()
        }

        if pageControl.currentPage == 2 {
            #warning("добить функцию")
            print ("open tabbar")
        }
    }
}

// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        OnboardingViewController.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell

        cell.prepare(imageName: OnboardingViewController.images[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

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

// MARK: - Setup Constraints

extension OnboardingViewController {
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Const.itemSize.height)
            make.centerX.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(onboardingLabel).inset(55)
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






// MARK: - Preview Provider

//import SwiftUI
//
//struct StartViewProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().ignoresSafeArea()
//    }
//    
//    struct ContainerView: UIViewRepresentable {
//        func makeUIView(context: Context) -> UIView {
//            let viewController = OnboardingViewController()
//            return viewController.view
//        }
//        
//        func updateUIView(_ uiView: UIView, context: Context) { }
//    }
//}
//
