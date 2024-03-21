import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private let titleLabel = UILabel.makeLabel(font: UIFont.InterBold(ofSize: 20),
                                               textColor: UIColor.darkGray,
                                               numberOfLines: 0)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    private func setupViews() {
        
        contentView.addSubview(titleLabel)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 12
        layer.masksToBounds = true
        titleLabel.textAlignment = .center
        
    }
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
                  make.center.equalToSuperview()
              }
        }
    
    // MARK: - Global funcs
    func configure(with emoji: String, title: String) {
        titleLabel.text = "\(emoji) \(title)"
    }
}
