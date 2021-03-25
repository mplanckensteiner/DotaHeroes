//
//  HeroFilterButton.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/7/21.
//

import SwiftUI

struct HeroFilterButton: View {
    
    var imageName: String
    var backgroundColor: Color = .black
    var height: CGFloat = 24
    var width: CGFloat = 24
    
    @Binding var show: Bool
    
    var action: () -> Void
    var body: some View {
        Button(action: { action()}, label: {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(16)
        })
        .background(backgroundColor)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black, radius: 30, x: 0.0, y: 0.0)
    }
}

