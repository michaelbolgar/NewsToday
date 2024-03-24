//
//  EmptyView.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 20/03/24.
//

import UIKit

class EmptyView: UIView {

    //MARK: - UI Components
    let messageLabel = UILabel.makeLabel(text: "You haven't saved any articles yet. Start reading and bookmarking                                   them now",
                                         font: UIFont.InterRegular(ofSize: 16),
                                         textColor: UIColor.blackPrimary,
                                         numberOfLines: 0)
    
    let greyImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Ellipse")
    return imageView
        }()

    let bookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "emptyStatePic")
    return imageView
        }()

    // MARK: - Initializer
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setupConstraints()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupViews() {
            [messageLabel, greyImageView].forEach { addSubview($0) }
            greyImageView.addSubview(bookImageView)
        }
    }


extension EmptyView {
    func setupConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(418)
            make.leading.trailing.equalToSuperview().inset(60)
        }

        greyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(322)
            make.centerX.equalToSuperview()
        }

        bookImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
