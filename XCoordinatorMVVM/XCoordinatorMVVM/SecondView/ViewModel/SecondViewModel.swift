//
//  SecondViewModel.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 14.02.2025.
//

import Foundation
import XCoordinator

class SecondViewModel: ViewModelProtocol {
    
    typealias State = SecondView.State
    typealias Interactions = SecondView.Interaction
    
    @Published var state: State
    
    var router: WeakRouter<MainListRoute>
    
    init(router: WeakRouter<MainListRoute>) {
        self.router = router
        self.state = .init()
    }
    
    func handle(_ interaction: SecondView.Interaction) {
        switch interaction {
        case .back: router.trigger(.back)
        }
    }
}
