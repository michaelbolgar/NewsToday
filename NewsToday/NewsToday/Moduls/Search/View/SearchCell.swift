//
//  SearchCell.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 25/03/24.
//

import UIKit

class SearchCell: UITableViewCell {
    static let identifier = "SearchCell"
    //MARK: - UI Components
    private let searchImage: UIImageView = {
    let image = UIImageView()
    image.layer.cornerRadius = 12
    image.image = UIImage(systemName: "questionmark",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))?.withTintColor(.black, renderingMode: .alwaysOriginal)
    return image
    }()

     let categoryLabel = UILabel.makeLabel(font: UIFont.InterRegular(ofSize: 14),
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
    //    searchImage.image = info.searchImage
        categoryLabel.text = info.author
        mainLabel.text = info.title
    }

    private func configure() {
        [searchImage, categoryLabel, mainLabel].forEach {addSubview($0) }
    }
}


extension SearchCell {
    func setupConstraints() {
        searchImage.snp.makeConstraints { make in
            make.width.height.equalTo(96)
            make.top.leading.equalToSuperview()
        }

        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(searchImage.snp.trailing).offset(8)
        }

        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
            make.leading.equalTo(searchImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
