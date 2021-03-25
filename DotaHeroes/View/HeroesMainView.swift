//
//  HeroesMainView.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI

struct HeroesMainView: View {
    
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    
    @ObservedObject var viewModel = HeroViewModel()
    @State var showFilterButtons = false
    @State var filterApplied = false
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    SearchBar(text: $searchText)
                        .accentColor(.black)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    
                    ScrollView{
                        LazyVGrid(columns: gridItems, spacing: 15) {
                            let dataSource = filterApplied ? viewModel.filteredHeroes : viewModel.hero
                            ForEach(dataSource.filter({ ("\($0)".contains(searchText.lowercased()) || searchText.isEmpty) })) { hero in
                                NavigationLink(
                                    destination: NavigationLazyView(HeroDetailView(hero: hero)),
                                    label: {
                                        HeroCell(hero: hero)
                                    })
                                
                            }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .navigationTitle("Dota Heroes")
                    .onAppear{
                        viewModel.fetchHeroes()
                    }
                }
                //.padding()
                
                VStack {
                    if showFilterButtons {
                        HeroFilterButton(imageName: "melee", backgroundColor: .red, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterHeroes(by: "Melee")
                        }
                        
                        HeroFilterButton(imageName: "ranged", backgroundColor: .blue, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterHeroes(by: "Ranged")
                        }
                    }
                    
                    let imageName = filterApplied ? "refresh" : "filter"
                    HeroFilterButton(imageName: imageName, height: 36, width: 36, show: $showFilterButtons) {
                        filterApplied ? filterApplied.toggle() : showFilterButtons.toggle()
                    }.rotationEffect(.init(degrees: self.showFilterButtons ? 180 : 0))
                }
                .padding()
                .animation(.spring())
            }
        }
    }
}

struct HeroesMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesMainView()
    }
}
