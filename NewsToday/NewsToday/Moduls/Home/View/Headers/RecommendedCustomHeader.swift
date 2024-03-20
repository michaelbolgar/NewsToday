//
//  RecommendedCustomHeader.swift
//  NewsToday
//
//  Created by Анастасия on 20.03.2024.
//

import UIKit

final class RecommendedCustomHeader: UICollectionReusableView {
    
    #warning("нужно проставить разметку по markdown")

    static var reuseIdentifier: String {"\(Self.self)"}
    
    private let titleLabel = UILabel.makeLabel(text: "Recommended for you",
                                       font: UIFont.InterSemiBold(ofSize: 20),
                                       textColor: UIColor.blackPrimary,
                                       numberOfLines: nil)
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.setTitleColor(UIColor.greyPrimary, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.titleLabel?.font = UIFont.InterRegular(ofSize: 14)
        return button
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(seeAllButton)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(verticalStack)
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
