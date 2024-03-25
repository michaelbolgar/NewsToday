
//  OnboardingRouter.swift
//  NewsToday
//
//  Created by Семен Шевчик on 23.03.2024.
//

import UIKit

final class OnboardingRouter: BaseRouter {

    let navigationController: UINavigationController
    private let factory: AppFactory

    init(navigationController: UINavigationController, factory: AppFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        //factory.makeRootRouter(nil).showMainTabbar()
    }
}
