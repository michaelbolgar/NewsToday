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
    private var isButtonSelected = false

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
        fatalError(Errors.fatalError)
    }

    //MARK: -> Functions
    private func setupViews() {
        addSubview(titleButton)

        titleButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func prepareForReuse() {
        titleButton.removeTarget(nil, action: nil, for: .allEvents)
    }

    func resetButtonState() {
        if self.isButtonSelected {
            self.titleButton.backgroundColor = .greyLighter
            self.titleButton.setTitleColor(UIColor.greyPrimary, for: .normal)
        } else {
            self.titleButton.backgroundColor = .purplePrimary
            self.titleButton.setTitleColor(UIColor.white, for: .normal)
        }
        self.isButtonSelected = !self.isButtonSelected
    }

    func configure(titleCategory: String, handler: @escaping (String) -> Void) {
        titleButton.setTitle(titleCategory, for: .normal)

         let action = UIAction { _ in
            handler(titleCategory)
            self.resetButtonState()
        }

        titleButton.addAction(action, for: .touchUpInside)
    }
}
