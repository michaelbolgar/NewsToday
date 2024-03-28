//
//  LanguageViewController.swift
//  NewsToday
//
//  Created by Андрей Линьков on 23.03.2024.
//

import UIKit

protocol LanguageViewControllerProtocol: AnyObject {

}

final class LanguageViewController: UIViewController {
    
//    //MARK: - Presenter
//    var presenter: LanguagePresenterProtocol!
//    
    
    // MARK: - UI Elements
    
    private let languagePageTitle = UILabel.makeLabel(text: "Language",
                                                      font: UIFont.InterBold(ofSize: 24),
                                                      textColor: .blackPrimary,
                                                      numberOfLines: nil)
    
    
    private let engLanguageButton: UIView = {
        let element = UIView()
        element.backgroundColor = .greyLighter
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let engLanguage = UILabel.makeLabel(text: "English",
                                                font: UIFont.InterBold(ofSize: 16),
                                                textColor: .darkGray,
                                                numberOfLines: nil)
    
    private let checkSymbolE: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Check img")
        return element
    }()
    
    private let rusLanguageButton: UIView = {
        let element = UIView()
        element.backgroundColor = .greyLighter
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let rusLanguage = UILabel.makeLabel(text: "Russian",
                                                font: UIFont.InterBold(ofSize: 16),
                                                textColor: .darkGray,
                                                numberOfLines: nil)

    private let checkSymbolR: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Check img")
        return element
    }()
    
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    
    //MARK: Private Methods
    private func setupViews() {
        [ engLanguageButton, engLanguage, rusLanguageButton, rusLanguage, checkSymbolE, checkSymbolR, languagePageTitle].forEach {view.addSubview($0)}
    }
    
    private func setupConstraints() {
        
        languagePageTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(130)
            make.height.equalTo(32)
        }
        
        engLanguageButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        engLanguage.snp.makeConstraints { make in
            make.left.equalTo(engLanguageButton).inset(24)
            make.top.equalTo(engLanguageButton).inset(16)
            make.height.equalTo(24)
        }
        
        checkSymbolE.snp.makeConstraints { make in
            make.right.equalTo(engLanguageButton).inset(16)
            make.top.equalTo(engLanguageButton).inset(16)
            make.height.equalTo(24)
        }
        
        rusLanguageButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(152)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        rusLanguage.snp.makeConstraints { make in
            make.left.equalTo(rusLanguageButton).inset(24)
            make.top.equalTo(rusLanguageButton).inset(16)
            make.height.equalTo(24)
        }
        
        checkSymbolR.snp.makeConstraints { make in
            make.right.equalTo(rusLanguageButton).inset(16)
            make.top.equalTo(rusLanguageButton).inset(16)
            make.height.equalTo(24)
        }
    }
}
