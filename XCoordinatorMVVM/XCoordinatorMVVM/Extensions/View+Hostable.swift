//
//  View+Hostable.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 13.02.2025.
//

import Foundation
import SwiftUI

extension View {
    public func hostable() -> UIHostingController<Self> {
        .init(rootView: self)
    }
}
