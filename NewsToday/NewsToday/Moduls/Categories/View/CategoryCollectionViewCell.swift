import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    let titleLabel = UILabel.makeLabel(font: UIFont.InterBold(ofSize: 18),
                                       textColor: UIColor.greyDark,
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
        contentView.layer.borderColor = UIColor.greyLight.cgColor
        contentView.layer.cornerRadius = 15
        layer.masksToBounds = true
        backgroundColor = UIColor.greyLighter
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
