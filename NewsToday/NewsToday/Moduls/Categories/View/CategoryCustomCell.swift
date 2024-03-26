import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var timer = Timer()
    
//    override var isSelected: Bool {
//        didSet {
//            titleLabel.textColor = .white
//            contentView.backgroundColor = .purplePrimary
//
//            UIView.animate(withDuration: 0.2, delay: 0.5, options: [], animations: {
//                     self.contentView.backgroundColor = .greyLighter
//                     self.titleLabel.textColor = .darkGray
//                 }, completion: nil)
//            }
//        }
    
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
    
    func animateSelectionChange(isSelected: Bool) {
        print("animateSelectionChange isSelected: \(isSelected)")
        if isSelected {
            self.contentView.backgroundColor = .purplePrimary
            self.titleLabel.textColor = .white // Немедленное изменение цвета текста на белый
            print(titleLabel.textColor!)
            // Анимация возвращения к исходным цветам с задержкой
            UIView.animate(withDuration: 0.2, delay: 0.5, options: [], animations: {
                self.contentView.backgroundColor = .greyLighter
                self.titleLabel.textColor = .darkGray
            })
        } else {
            
            // Немедленное возвращение к исходным цветам без анимации
            self.contentView.backgroundColor = .greyLighter
            self.titleLabel.textColor = .darkGray
        }
    }
    
    // MARK: - Global funcs
    func configure(with emoji: String, title: String) {
        print("Configuring cell with title: \(title)")

        titleLabel.text = "\(emoji) \(title)"
    }
}
