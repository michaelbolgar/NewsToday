//
//  MyCollectionViewCell.swift
//  NewsToday
//
//  Created by Семен Шевчик on 19.03.2024.
//

import UIKit

final class myCollectionViewCell: UICollectionViewCell {
    static let id = "MyCollectionViewCell"

    #warning("тут тоже можно бы сделать разметку по markdown")

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        #warning("а почему тут внезапно на анкерах?")
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(imageName: String?) {
        guard let imageName = imageName, let image = UIImage(named: imageName) else {
            imageView.image = nil
            return
        }
        imageView.image = image
    }
}
