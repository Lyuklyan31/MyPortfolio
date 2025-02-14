//
//  MainCoordinator.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 13.02.2025.
//

import Foundation
import XCoordinator

enum MainListRoute: Route {
    case root
    case secondView
    case back
}

class MainListCoordinator: NavigationCoordinator<MainListRoute> {
    init() {
        super.init(initialRoute: .root)
    }
    
    override func prepareTransition(for route: MainListRoute) -> NavigationTransition {
        switch route {
        case .root:
            let presentable = presentableMainViewController()
            return .push(presentable)
        case .secondView:
            let presentable = presentableSecondViewController()
            return .push(presentable)
        case .back:
            return .pop()
        }
    }
    
    private func presentableMainViewController() -> Presentable {
        let viewModel = MainViewModel(router: weakRouter).erase()
        let viewController = MainContentView(viewModel: viewModel).hostable()
        return viewController
    }
    
    private func presentableSecondViewController() -> Presentable {
        let viewModel = SecondViewModel(router: weakRouter).erase()
        let viewController = SecondView(viewModel: viewModel).hostable()
        viewController.navigationItem.hidesBackButton = true
        return viewController
    }
}
