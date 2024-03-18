import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    let label = UILabel.makeLabel(text: "Hello, world!",
                                  font: UIFont.InterBold(ofSize: 20),
                                  textColor: .blackLight,
                                  numberOfLines: nil)
    private lazy var image: UIImage = {
        let element = UIImage()
        ele
        return element
    }()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purpleLight
        layout()
    }

    //MARK: Private Methods
    private func layout() {
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
