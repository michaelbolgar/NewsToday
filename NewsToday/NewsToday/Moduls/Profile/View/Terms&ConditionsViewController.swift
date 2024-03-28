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
    
    private let termsConditions = UILabel.makeLabel(text: "Terms & Conditions",
                                                    font: UIFont.InterBold(ofSize: 24),
                                                    textColor: .blackPrimary,
                                                    numberOfLines: nil)
    
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

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    private func setupViews(){
        [background, textRuleView, termsConditions].forEach {view.addSubview($0)}
    }
    
}

extension TermsConditionsViewController{
    private func setupConstrains(){
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textRuleView.snp.makeConstraints {make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(76)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        termsConditions.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.left.leading.trailing.equalToSuperview().inset(74)
            make.height.equalTo(32)
        }
    }
}
