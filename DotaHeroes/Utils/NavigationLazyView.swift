//
//  NavigationView.swift
//  DotaHeroes
//
//  Created by Miguel Planckensteiner on 2/6/21.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
