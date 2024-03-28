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



    private let descriptionLabel = UILabel.makeLabel(text: Constants.homeDescription,
                                       font: UIFont.InterRegular(ofSize: 16),
                                       textColor: UIColor.greyPrimary,
                                                     numberOfLines: .zero)

    private let searchBar = SearchBarView()

    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .firstBaseline
        stack.axis = .vertical
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(searchBar)
      //  stack.spacing = 20
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

        searchBar.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.trailing.leading.equalToSuperview()
        }
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
