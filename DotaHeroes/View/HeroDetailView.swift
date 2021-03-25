//
//  HeroDetailView.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeroDetailView: View {
    
    let hero: Hero
    let viewModel: HeroCellViewModel
    
    init(hero: Hero) {
        self.hero = hero
        self.viewModel = HeroCellViewModel(hero: hero)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(viewModel.backgroundColor), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Color.white.offset(y: 380)
            
            ScrollView {
                WebImage(url: URL(string: "https://api.opendota.com" + hero.img))
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 20)
                    .frame(width: 250, height: 250)
                    .padding(.bottom, 20)
//                    .cornerRadius(20)
                
                VStack {
                    Text(hero.localized_name)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 30)
                        .foregroundColor(.black)
                        
                    
                    Text(hero.attack_type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(Color(viewModel.backgroundColor))
                        .cornerRadius(20)
                    
                    HStack {
                        ForEach(hero.roles, id: \.self) { role in
                            Text(role.description.capitalized)
                                .font(.system(size: 12))
                                
                                .padding(.top, 10)
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                                .padding(.trailing, 10)
                                .foregroundColor(.black)
                                .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.25)))
                        }
                    }.padding()
                    
                    HStack { Spacer() }
                    
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding(.top)
                .zIndex(-1)
                
                HStack {
                    Text("Stats")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                
                BarCountView(hero: hero)
                    .padding(.trailing)
                    .padding(.top, 10)
            }
        }
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(hero: heroMock)
    }
}
