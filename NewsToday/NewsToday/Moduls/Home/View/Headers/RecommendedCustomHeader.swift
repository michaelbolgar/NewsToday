//
//  RecommendedCustomHeader.swift
//  NewsToday
//
//  Created by Анастасия on 20.03.2024.
//

import UIKit

final class RecommendedCustomHeader: UICollectionReusableView {

    //MARK: -> Properties
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
        stack.alignment = .bottom
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(seeAllButton)
        return stack
    }()

    //MARK: -> init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    required init?(coder: NSCoder) {
        fatalError(Errors.fatalError)
    }

    //MARK: -> Function
    private func setViews() {
        addSubview(verticalStack)
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
