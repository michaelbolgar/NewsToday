import UIKit
import SnapKit

protocol DetailsViewControllerProtocol: AnyObject {
    func setupData(with testData: ([DetailsModel]))
    func displayData()
}

final class DetailsViewController: UIViewController, DetailsViewControllerProtocol, UITextViewDelegate {
    
    //MARK: - Presenter
    private let presenter = DetailsPresenter()
    
    
    //MARK: - Private properties
    private var testData: [DetailsModel] = []
    weak private var detailsPresenterProtocol: DetailsPresenterProtocol?
    
    //MARK: - UI Components
    private var headerHeightConstraint: NSLayoutConstraint!
    private let contentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        return image
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "share-icon"), for: .normal)
        return button
    }()
    
    private let labelView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purplePrimary
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let categoryLabel = UILabel.makeLabel(font: UIFont.InterSemiBold(ofSize: 12), 
                                                  textColor: .white,
                                                  numberOfLines: 1)
    private let headlineLabel = UILabel.makeLabel(font: UIFont.InterBold(ofSize: 20), 
                                                  textColor: .white,
                                                  numberOfLines: 2)
    private let authorLabel = UILabel.makeLabel(font: UIFont.InterSemiBold(ofSize: 16), 
                                                textColor: .white,
                                                numberOfLines: 1)
    private let authorGreyLabel = UILabel.makeLabel(text: "Author", 
                                                    font: UIFont.InterRegular(ofSize: 14), textColor: UIColor.greyLight,
                                                    numberOfLines: 1)
    private let titleLabel = UILabel.makeLabel(font: UIFont.InterSemiBold(ofSize: 16), 
                                               textColor: UIColor.blackPrimary,
                                               numberOfLines: 1)
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.InterRegular(ofSize: 16)
        textView.textColor = UIColor.greyDark
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter.setDetailsViewControllerProtocol(detailsViewControllerProtocol: self)
        self.detailsPresenterProtocol = presenter
        self.detailsPresenterProtocol?.getData()
        configureController()
        setNavigationBar(title: "")
    }
    // MARK: - Public Methods
    func setupData(with testData: ([DetailsModel])) {
        self.testData = testData
        
    }
    
    func displayData() {
        categoryLabel.text = testData.first?.categoryLabel
        headlineLabel.text = testData.first?.headlineLabel
        authorLabel.text = testData.first?.authorLabel
        titleLabel.text = testData.first?.titleLabel
        contentTextView.text = testData.first?.contentTextView
     
    }
    
    @objc func bookmarkButtonTapped() {

       }
    
    @objc func shareButtonTapped() {

       }
    
    // MARK: Private methods
    private func setupViews() {
        [contentImage, shareButton, labelView, categoryLabel, headlineLabel, authorLabel, authorGreyLabel, titleLabel, contentTextView].forEach {view.addSubview($0) }
        labelView.addSubview(categoryLabel)
    }
    
    private func configureController() {
        let bookmarkButton = UIBarButtonItem(image: UIImage(named: "bookmark-icon"), style: .plain, target: self, action: #selector(bookmarkButtonTapped))
        bookmarkButton.tintColor = .white
        navigationItem.rightBarButtonItem = bookmarkButton
        headerHeightConstraint = contentImage.heightAnchor.constraint(equalToConstant: 70)
        headerHeightConstraint.isActive = true
        view.backgroundColor = .systemBackground
        contentTextView.delegate = self
    }
    
    private func setupConstraints() {
        contentImage.clipsToBounds = true
        contentImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
           make.leading.trailing.equalToSuperview()
   
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        labelView.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(32)
            make.top.equalToSuperview().offset(168)
            make.leading.equalToSuperview().offset(20)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        headlineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(216)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(296)
            make.leading.equalToSuperview().offset(26)
        }
        
        authorGreyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(320)
            make.leading.equalToSuperview().offset(26)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    private func animateHeader() {
        self.headerHeightConstraint.constant = 350
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}


extension DetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y / 100
            
            if self.headerHeightConstraint.constant < 65 {
                self.headerHeightConstraint.constant = 65
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
}

