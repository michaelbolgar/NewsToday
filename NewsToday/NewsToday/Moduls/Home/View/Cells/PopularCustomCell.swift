//
//  PopularCustomCell.swift
//  NewsToday
//
//  Created by Анастасия on 19.03.2024.
//

import UIKit

final class PopularCustomCell: UICollectionViewCell {

    //MARK: -> Properties
    static var reuseIdentifier: String {"\(Self.self)"}

    private let titleLabel = UILabel.makeLabel(
                                        text: "",
                                        font: UIFont.InterRegular(ofSize: 12),
                                        textColor: UIColor.greyLighter,
                                        numberOfLines: nil
                                        )

    private let textLabel = UILabel.makeLabel(
                                    text: "",
                                    font: UIFont.InterBold(ofSize: 16),
                                    textColor:  UIColor.white,
                                    numberOfLines: .zero
                                    )

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true

        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageView.addSubview(view)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        return imageView
    }()

    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(textLabel)
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
        addSubview(imageView)
        imageView.addSubview(verticalStack)

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        verticalStack.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }

    func configure(imageURL: String, title: String, text: String, id: String) {

        DispatchQueue.main.async {
            self.imageView.loadImage(withURL: imageURL, id: id)
        }
        titleLabel.text = title
        textLabel.text = text
    }
}
