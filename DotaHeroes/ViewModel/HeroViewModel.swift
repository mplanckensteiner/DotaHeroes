//
//  HeroesViewModel.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI

class HeroViewModel: ObservableObject {
    
    @Published var hero = [Hero]()
    @Published var filteredHeroes = [Hero]()
    
    let baseUrl = "https://api.opendota.com/api/heroStats"
    
//    init() {
//        fetchHeroes()
//    }
    
    
    func fetchHeroes() {
        guard let url = URL(string:  baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard let heroes = try? JSONDecoder().decode([Hero].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.hero = heroes
            }
        }.resume()
    }
    
    func filterHeroes(by filter: String) {
        filteredHeroes = hero.filter({$0.attack_type == filter })
    }
}
