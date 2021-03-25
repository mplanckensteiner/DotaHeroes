//
//  Heroes.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import Foundation

struct Hero: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let localized_name: String
    let attack_type: String
    let icon: String
    let img: String
    let roles: [String]
    
    let base_health: Int
    let move_speed: Int
}


let heroMock = Hero(id: 1, name: "Axe", localized_name: "Axe", attack_type: "Melle", icon: "noImage", img: "noImage", roles: ["Carry", "Escape", "Nuker"], base_health: 200, move_speed: 80)
