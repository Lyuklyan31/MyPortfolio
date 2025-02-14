//
//  MainContentView.swift
//  XCoordinatorMVVM
//
//  Created by Oleh Liuklian  on 12.02.2025.
//

import SwiftUI

struct MainContentView: View {
    @ObservedObject var viewModel: AnyViewModel<MainContentView.State, MainContentView.Interaction>
    var body: some View {
        ZStack {
            
            Color.yellow
            
            Button {
                viewModel.handle(.moveToSecond)
            } label: {
                buttonLabelView
            }
        }
        .ignoresSafeArea(.all)
    }
    
    private var buttonLabelView: some View {
        Text("Move to next View")
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.blue)
            }
    }
}

