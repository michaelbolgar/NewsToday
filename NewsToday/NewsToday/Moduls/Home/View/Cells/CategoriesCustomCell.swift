//
//  CategoriesCustomCell.swift
//  NewsToday
//
//  Created by Анастасия on 19.03.2024.
//

import UIKit

final class CategoriesCustomCell: UICollectionViewCell {
    
    //MARK: -> Properties
    static var reuseIdentifier: String {"\(Self.self)"}
    
    private let titleButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.greyPrimary, for: .normal)
        button.titleLabel?.font = UIFont.InterRegular(ofSize: 14)
        button.backgroundColor = .greyLighter
        button.layer.cornerRadius = 16
        return button
    }()

    //MARK: -> init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: -> Functions
    private func setupViews() {
        addSubview(titleButton)
        
        titleButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func configure(title: String) {
        titleButton.setTitle(title, for: .normal)
    }
}
