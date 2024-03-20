//
//  EmptyView.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 20/03/24.
//

import UIKit

class EmptyView: UIView {

    #warning("markdown")
    let messageLabel = UILabel.makeLabel(text: "You haven't saved any articles yet. Start reading and bookmarking                                   them now",
                                         font: UIFont.InterRegular(ofSize: 16),
                                         textColor: UIColor.blackPrimary,
                                         numberOfLines: 0)
    
    let greyImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "ellipse")
            return imageView
        }()

    #warning("а куда код уехал?)")
        let bookImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "emptyStatePic")
            return imageView
        }()

    //markdown
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupViews() {
            //рекомендации аналогично двум другим файлам
            addSubview(messageLabel)
            addSubview(greyImageView)
            greyImageView.addSubview(bookImageView)

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
