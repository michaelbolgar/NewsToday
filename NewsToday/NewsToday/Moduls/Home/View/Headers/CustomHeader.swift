//
//  CustomHeader.swift
//  NewsToday
//
//  Created by Анастасия on 19.03.2024.
//

import UIKit

final class CustomHeaderView: UICollectionReusableView {
    
    //MARK: -> Properties
    static var reuseIdentifier: String {"\(Self.self)"}
    
    private let titleLabel = UILabel.makeLabel(text: "Browse",
                                       font: UIFont.InterBold(ofSize: 24),
                                       textColor: UIColor.blackPrimary,
                                       numberOfLines: 0)
    
    private let descriptionLabel = UILabel.makeLabel(text: "Discover things of this world",
                                       font: UIFont.InterRegular(ofSize: 16),
                                       textColor: UIColor.greyPrimary,
                                       numberOfLines: 0)
    
    private let searchBar = SearchBarView()

    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .firstBaseline
        stack.axis = .vertical
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(searchBar)
        stack.setCustomSpacing(-20, after: titleLabel)
        stack.spacing = 20
        return stack
    }()
    
    //MARK: -> init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -> Function
    private func setViews() {
        addSubview(verticalStack)
        
        searchBar.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.trailing.leading.equalToSuperview()
        }
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
