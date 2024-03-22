import UIKit

protocol DetailsPresenterProtocol: AnyObject {
    func getData()
}

final class DetailsPresenter: DetailsPresenterProtocol {
   
    weak private var detailsViewControllerProtocol: DetailsViewControllerProtocol?
    var testData = DetailsModel.testData
    
    func setDetailsViewControllerProtocol(detailsViewControllerProtocol: DetailsViewControllerProtocol?) {
        self.detailsViewControllerProtocol = detailsViewControllerProtocol
    }
    
    private func loadTestData() {
        self.detailsViewControllerProtocol?.setupData(with: self.testData)
     
    }
    
    func getData() {
        self.loadTestData()
        self.detailsViewControllerProtocol?.displayData()
    }
}
