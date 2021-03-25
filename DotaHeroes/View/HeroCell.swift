//
//  HeroCell.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeroCell: View {
    
    let hero: Hero
    let viewModel: HeroCellViewModel
    
    
    init(hero: Hero) {
        self.hero = hero
        self.viewModel = HeroCellViewModel(hero: hero)
    }
    
    
    var body: some View {
        VStack(spacing: 12) {
            WebImage(url: URL(string: "https://api.opendota.com" + hero.img))
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(spacing: 10) {
                Spacer(minLength: 0)
                
                Text(hero.localized_name)
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Text(hero.attack_type)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.25)))
                    .padding(.bottom, 10)
                    
            }
        }
        .padding(.top)
        .frame(width: 160)
        .background(Color(viewModel.backgroundColor))
        .cornerRadius(15)
        .shadow(color: Color(viewModel.backgroundColor), radius: 6, x: 0.0, y: 0.0)
    }
}


