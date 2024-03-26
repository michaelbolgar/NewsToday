//
//  Terms&ConditionsViewController.swift
//  NewsToday
//
//  Created by Андрей Линьков on 22.03.2024.
//

import SnapKit
import UIKit

class TermsConditionsViewController: UIViewController {
    
    //MARK: - UI Elements
    private let background: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = .white
        return element
    }()
    
    private let termsConditions: UITextView = {
        let element = UITextView()
        element.text = "Terms & Conditions"
        element.textColor = .blackPrimary
        element.backgroundColor = .clear
        element.font = .InterBold(ofSize: 24)
        return element
    }()
    
    private let textRuleView: UITextView = {
        let element = UITextView()
        element.backgroundColor = .clear
        element.font = .InterRegular(ofSize: 16)
        element.textColor = .greyPrimary
        element.isEditable = false
        element.isScrollEnabled = true
        element.isSelectable = false
        element.text = textForRules.termsConditionsText
        return element
    }()
    
    private let backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.imageView?.tintColor = .black
        return element
    }()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    private func setupViews(){
        view.addSubview(background)
        view.addSubview(textRuleView)
        view.addSubview(backButton)
        view.addSubview(termsConditions)
    }
    
}

extension TermsConditionsViewController{
    private func setupConstrains(){
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        textRuleView.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(76)
            maker.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        termsConditions.snp.makeConstraints { make in
            make.top.equalTo(view).inset(68)
            make.left.equalTo(view).inset(74)
            make.width.equalTo(260)
            make.height.equalTo(32)
        }
    }
}
