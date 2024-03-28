//
//  BookmarkCell.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 20/03/24.
//

import UIKit

class BookmarkCell: UITableViewCell {
    static let reuseID = "BookmarkCell"
    
    //MARK: - UI Components
    private let bookmarkImage: UIImageView = {
    let image = UIImageView()
    image.layer.cornerRadius = 12
    return image
    }()

    private let categoryLabel = UILabel.makeLabel(font: UIFont.InterRegular(ofSize: 14), 
                                                  textColor: UIColor.greyPrimary,
                                                  numberOfLines: 1)

    private let mainLabel = UILabel.makeLabel(font: UIFont.InterBold(ofSize: 16),
                                              textColor: UIColor.blackPrimary,
                                              numberOfLines: 0)

    //MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Public Methods

    func set(info: Article) {
        DispatchQueue.main.async {
            self.bookmarkImage.loadImage(withURL: info.urlToImage ?? "https://picsum.photos/200", id: info.source.id ?? "")
        }
        categoryLabel.text = info.author
        mainLabel.text = info.title
    }

    private func configure() {
        [bookmarkImage, categoryLabel, mainLabel].forEach {addSubview($0) }
    }
}


extension BookmarkCell {
    func setupConstraints() {
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
