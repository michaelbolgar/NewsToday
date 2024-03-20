//
//  BookmarkCell.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 20/03/24.
//

import UIKit

class BookmarkCell: UITableViewCell {
    static let reuseID = "BookmarkCell"
    
    private let bookmarkImage: UIImageView = {
           let image = UIImageView()
           image.layer.cornerRadius = 12
           image.image = UIImage(systemName: "questionmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))?.withTintColor(.black, renderingMode: .alwaysOriginal)
           return image
       }()
    private let categoryLabel = UILabel.makeLabel(font: UIFont.InterRegular(ofSize: 14), textColor: UIColor.greyPrimary, numberOfLines: 1)
    private let mainLabel = UILabel.makeLabel(font: UIFont.InterBold(ofSize: 16), textColor: UIColor.blackPrimary, numberOfLines: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(info: Bookmarks) {
    //    bookmarkImage.image = info.bookmarkImage
        categoryLabel.text = info.categoryLabel
        mainLabel.text = info.textLabel
    }

    private func configure() {
        addSubview(bookmarkImage)
        addSubview(categoryLabel)
        addSubview(mainLabel)
        
        bookmarkImage.snp.makeConstraints { make in
            make.width.height.equalTo(96)
            make.top.leading.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(bookmarkImage.snp.trailing).offset(8)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
            make.leading.equalTo(bookmarkImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
