//
//  XCoordinatorMVVMApp.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 12.02.2025.
//

import SwiftUI
import XCoordinator

@main
struct XCoordinatorMVVMApp: App {
    private let coordinator = MainListCoordinator()

    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator).ignoresSafeArea()
        }
    }
}

// MARK: - Bridge UIKit (XCoordinator) to SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    let coordinator: MainListCoordinator

    func makeUIViewController(context: Context) -> UIViewController {
        coordinator.rootViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // TODO
    }
}
