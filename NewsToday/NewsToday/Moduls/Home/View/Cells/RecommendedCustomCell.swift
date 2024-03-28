//
//  RecommendedCustomCell.swift
//  NewsToday
//
//  Created by Анастасия on 19.03.2024.
//

import UIKit

final class RecommendedCustomCell: UICollectionViewCell {

    //MARK: -> Properties
    static var reuseIdentifier: String {"\(Self.self)"}

    private let categoryLabel = UILabel.makeLabel(
                                       text: "",
                                       font: UIFont.InterRegular(ofSize: 14),
                                       textColor: UIColor.greyPrimary,
                                       numberOfLines: nil
                                        )

    private let titleLabel = UILabel.makeLabel(
                                       text: "",
                                       font: UIFont.InterSemiBold(ofSize: 16),
                                       textColor: UIColor.blackPrimary,
                                       numberOfLines: nil
                                        )

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(categoryLabel)
        stack.addArrangedSubview(titleLabel)
        return stack
    }()

    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.spacing = 20
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(verticalStack)
        return stack
    }()

    //MARK: -> init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError(Errors.fatalError)
    }

    //MARK: -> Functions

    private func setupViews() {
        addSubview(horizontalStack)

        horizontalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.height.equalTo(96)
            $0.width.equalTo(96)
        }
    }

    func configure(model: RecommendedModel) {
        imageView.image = UIImage(named: model.imageName)
        categoryLabel.text = model.categoryName
        titleLabel.text = model.titleText
    }
}
