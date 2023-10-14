//
//  ContentView.swift
//  Escapades
//
//  Created by Raphael Salaja on 03/10/2023.
//

import Observation
import SwiftUI

@Observable
class Escapade: Identifiable {
    var name: String
    var view: AnyView

    init(name: String, view: AnyView) {
        self.name = name
        self.view = view
    }
}

struct ContentView: View {
    var escapades: [Escapade] = [
        Escapade(name: "Layered Stack", view: AnyView(LayeredStackShowcase())),
        Escapade(name: "Banter Club", view: AnyView(BanterClub())),
        Escapade(name: "Border Radius Calculator", view: AnyView(BorderRadiusCalculator())),
        Escapade(name: "Link Preview", view: AnyView(LinkPeering()))
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(escapades) { escapade in
                    NavigationLink(destination: escapade.view) {
                        VStack(alignment: .leading) {
                            Text(escapade.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Escapades")
        }
    }
}

#Preview {
    ContentView()
}
