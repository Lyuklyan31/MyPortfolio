//
//  ViewModelProtocol.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 12.02.2025.
//

import Combine
import Foundation

public protocol ViewModelProtocol: ObservableObject where ObjectWillChangePublisher.Output == Void {
    
    // MARK: - Declarations

    associatedtype State
    associatedtype Interactions
    
    // MARK: - Properties
    
    var state: State { get }
    
    // MARK: - Public api

    func handle(_ interaction: Interactions)
}

extension ViewModelProtocol where Interactions == Never {
    func handle(_ interaction: Interactions) { }
}

extension ViewModelProtocol where ObjectWillChangePublisher == ObservableObjectPublisher {
    public func erase() -> AnyViewModel<State, Interactions> {
        .init(self)
    }
}
