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
    return image
    }()
    let backView: UIView = {
        let view = UIView()
        return view
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
         DispatchQueue.main.async {
             self.searchImage.loadImage(withURL: info.urlToImage ?? "https://picsum.photos/200", 
                                        id: info.source.id ?? "")
         }
         
        categoryLabel.text = info.author
        mainLabel.text = info.title
    }

    private func configure() {
        addSubview(backView)
        [searchImage, categoryLabel, mainLabel].forEach {backView.addSubview($0) }
    }
}


extension SearchCell {
    func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(5)
            make.bottom.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(100)
        }
        
        searchImage.snp.makeConstraints { make in
            make.width.height.equalTo(96)
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(searchImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }

        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
            make.leading.equalTo(searchImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
