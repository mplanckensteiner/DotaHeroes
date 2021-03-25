//
//  HeroCellViewModel.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI

struct HeroCellViewModel {
    let hero: Hero
    
    var backgroundColor:UIColor {
        
        switch hero.attack_type {
        case "Melee": return .systemRed
        case "Ranged": return .systemBlue
        default: return .systemIndigo
        }
    }
    
    init(hero: Hero) {
        self.hero = hero
    }
    
}
