//
//  CustomHeader.swift
//  NewsToday
//
//  Created by Анастасия on 19.03.2024.
//

import UIKit

final class CustomHeaderView: UICollectionReusableView {
    
    #warning("нужно проставить разметку по markdown")

    static var reuseIdentifier: String {"\(Self.self)"}
    
    private let titleLabel = UILabel.makeLabel(text: "Browse",
                                       font: UIFont.InterBold(ofSize: 24),
                                       textColor: UIColor.blackPrimary,
                                       numberOfLines: nil)
    
    private let descriptionLabel = UILabel.makeLabel(text: "Discover things of this world",
                                       font: UIFont.InterBold(ofSize: 16),
                                       textColor: UIColor.greyPrimary,
                                       numberOfLines: nil)
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(searchBar)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(verticalStack)
        
        searchBar.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(336)
        }
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
