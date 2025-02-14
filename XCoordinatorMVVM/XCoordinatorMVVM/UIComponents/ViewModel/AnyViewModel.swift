//
//  AnyViewModel.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 12.02.2025.
//

import Foundation
import Combine

public typealias ErasedViewModel<VM: ViewModelProtocol> = AnyViewModel<VM.State, VM.Interactions>

public final class AnyViewModel<State, Interactions>: ObservableObject {
    
    internal class _AnyViewModelBase<InnerState, InnerInteractions>: ViewModelProtocol {
        var state: InnerState { fatalError("abstract wrapper") }
        var objectWillChange: ObjectWillChangePublisher { fatalError("abstract wrapper") }
        func handle(_ interaction: InnerInteractions) {
            fatalError("abstract wrapper")
        }
    }
    
    internal final class _AnyViewModelBox<VM: ViewModelProtocol>: _AnyViewModelBase<VM.State, VM.Interactions> where VM.ObjectWillChangePublisher == ObservableObjectPublisher {
        private var viewModel: VM
        override var state: VM.State { viewModel.state }
        override var objectWillChange: VM.ObjectWillChangePublisher { viewModel.objectWillChange }
        override func handle(_ interaction: VM.Interactions) {
            viewModel.handle(interaction)
        }
        
        init(_ vm: VM) {
            viewModel = vm
        }
    }
    
    private var box: _AnyViewModelBase<State, Interactions>
    public var objectWillChange: ObservableObjectPublisher { box.objectWillChange }
    public var state: State { box.state }
    
    public func handle(_ interaction: Interactions) {
        box.handle(interaction)
    }
    
    public init<VM: ViewModelProtocol>(_ viewModel: VM) where VM.State == State, VM.Interactions == Interactions, VM.ObjectWillChangePublisher == ObservableObjectPublisher {
        box = _AnyViewModelBox(viewModel)
    }
}

// MARK: Extensions

extension AnyViewModel: Identifiable where State: Identifiable {
    public typealias ID = State.ID
    
    public var id: State.ID { state.id }
}

extension AnyViewModel: Equatable where State: Equatable {
    public static func == (lhs: AnyViewModel, rhs: AnyViewModel) -> Bool {
        lhs.state == rhs.state
    }
}

extension AnyViewModel: Hashable where State: Hashable {
    public var hashValue: Int { state.hashValue }
    
    public func hash(into hasher: inout Hasher) {
        state.hash(into: &hasher)
    }
}
