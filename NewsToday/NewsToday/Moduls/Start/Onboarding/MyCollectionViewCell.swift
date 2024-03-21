//
//  MyCollectionViewCell.swift
//  NewsToday
//
//  Created by Семен Шевчик on 19.03.2024.
//

import UIKit

final class myCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let id = "MyCollectionViewCell"
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func prepare(imageName: String?) {
        guard let imageName = imageName, let image = UIImage(named: imageName) else {
            imageView.image = nil
            return
        }
        imageView.image = image
    }
}
