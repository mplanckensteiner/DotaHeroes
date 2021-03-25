//
//  BarViews.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/7/21.
//

import SwiftUI

struct BarViews: View {
    var value: Int = 50
    var title: String = "Attack"
    var color: Color = .blue
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 35)
                .foregroundColor(.gray)
                .frame(width: 100)
            
            HStack {
                Text("\(value)")
                    .frame(width: 45)
                    .padding(.trailing)
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 30).animation(.default)
                        .foregroundColor(Color(.systemGray4))
                    
                    Capsule()
                        .frame(width: value > 250 ? CGFloat(200) : CGFloat(value), height: 30).animation(.default)
                        .foregroundColor(color)
                }
                Spacer()
            }.padding(.leading)
        }
    }
}

struct BarCountView: View {
    let hero: Hero
    var body: some View {
        VStack {
            BarViews(value: hero.base_health, title: "Health", color: .green)
            BarViews(value: hero.move_speed, title: "Move Speed", color: .blue)
        }
    }
}

struct BarViews_Previews: PreviewProvider {
    static var previews: some View {
        BarViews()
    }
}
