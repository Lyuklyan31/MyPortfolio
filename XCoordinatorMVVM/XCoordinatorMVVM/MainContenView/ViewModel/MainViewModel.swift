//
//  MainViewModel.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 12.02.2025.
//

import Foundation
import XCoordinator

class MainViewModel: ViewModelProtocol {
    
    typealias State = MainContentView.State
    typealias Interactions = MainContentView.Interaction
    
    @Published var state: State
    
    var router: WeakRouter<MainListRoute>
    
    init(router: WeakRouter<MainListRoute>) {
        self.router = router
        self.state = .init()
    }
    
    func handle(_ interaction: Interactions) {
        switch interaction {
        case .moveToSecond: router.trigger(.secondView)
        }
    }
}
