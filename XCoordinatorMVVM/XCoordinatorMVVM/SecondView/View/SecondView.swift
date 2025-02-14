//
//  SecondView.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 14.02.2025.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var viewModel: AnyViewModel<SecondView.State, SecondView.Interaction>
    
    var body: some View {
        ZStack {
            
            Color.blue
            
            Button {
                viewModel.handle(.back)
            } label: {
                buttonLabelView
            }
        }
        .ignoresSafeArea(.all)
    }
    
    private var buttonLabelView: some View {
        Text("Move to first View")
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.yellow)
            }
        
    }
}
