import UIKit

protocol DetailsPresenterProtocol: AnyObject {
    func getData(with data: [Article])
}

final class DetailsPresenter: DetailsPresenterProtocol {

    weak private var detailsViewControllerProtocol: DetailsViewControllerProtocol?


    func setDetailsViewControllerProtocol(detailsViewControllerProtocol: DetailsViewControllerProtocol?) {
        self.detailsViewControllerProtocol = detailsViewControllerProtocol
    }


    func getData(with data:[Article]) {
        self.detailsViewControllerProtocol?.setupData(with: data)
        self.detailsViewControllerProtocol?.displayData()
    }
}
