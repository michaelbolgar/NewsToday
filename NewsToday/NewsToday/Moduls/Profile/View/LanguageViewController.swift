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
    
    private let languagePageTitle: UITextView = {
        let element = UITextView()
        element.text = "Language"
        element.textColor = .blackPrimary
        element.backgroundColor = .clear
        element.font = .InterBold(ofSize: 24)
        return element
    }()
    
    private let backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.imageView?.tintColor = .black
        return element
    }()
    
    private let engLanguageButton: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let engLanguage: UITextView = {
        let element = UITextView()
        element.text = "English"
        element.textColor = .darkGray
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.font = .InterRegular(ofSize: 16)
        return element
    }()
    
    private let checkSymbolE: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Check img")
        return element
    }()
    
    private let rusLanguageButton: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.layer.cornerRadius = 12
        return element
    }()
    
    private let rusLanguage: UITextView = {
        let element = UITextView()
        element.text = "Russian"
        element.textColor = .darkGray
        element.backgroundColor = UIColor(red: 243/255,
                                          green: 244/255,
                                          blue: 246/255,
                                          alpha: 1)
        element.font = .InterRegular(ofSize: 16)
        return element
    }()
    
    private let checkSymbolR: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "Check img")
        return element
    }()
    
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        //setupViews()
        
    }
    
    
    //MARK: Private Methods
    private func layout() {
        
        view.addSubview(engLanguageButton)
        view.addSubview(engLanguage)
        view.addSubview(rusLanguageButton)
        view.addSubview(rusLanguage)
        view.addSubview(checkSymbolE)
        view.addSubview(checkSymbolR)
        view.addSubview(languagePageTitle)
        view.addSubview(backButton)
        
        languagePageTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.left.equalTo(view).inset(130)
            make.width.equalTo(260)
            make.height.equalTo(40)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(34)
            make.left.equalTo(view).inset(26)
        }
        
        engLanguageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.width.equalTo(336)
            make.height.equalTo(56)
        }
        
        engLanguage.snp.makeConstraints { make in
            make.left.equalTo(engLanguageButton).inset(24)
            make.top.equalTo(engLanguageButton).inset(10)
            make.width.equalTo(87)
            make.height.equalTo(30)
        }
        
        checkSymbolE.snp.makeConstraints { make in
            make.right.equalTo(engLanguageButton).inset(16)
            make.top.equalTo(engLanguageButton).inset(12)
            make.width.equalTo(24)
            make.height.equalTo(30)
        }
        
        rusLanguageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(152)
            make.width.equalTo(336)
            make.height.equalTo(56)
        }
        
        rusLanguage.snp.makeConstraints { make in
            make.left.equalTo(rusLanguageButton).inset(24)
            make.top.equalTo(rusLanguageButton).inset(10)
            make.width.equalTo(250)
            make.height.equalTo(30)
        }
        
        checkSymbolR.snp.makeConstraints { make in
            make.right.equalTo(rusLanguageButton).inset(16)
            make.top.equalTo(rusLanguageButton).inset(12)
            make.width.equalTo(24)
            make.height.equalTo(30)
        }
    }
}
