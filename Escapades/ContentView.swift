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
    var date: Date
    var view: AnyView

    init(name: String, date: Date, view: AnyView) {
        self.name = name
        self.date = date
        self.view = view
    }
}

struct ContentView: View {
    var escapades: [Escapade] = [
        Escapade(name: "Layered Stack",
                 date: Date(),
                 view: AnyView(LayeredStackShowcase())),
        Escapade(name: "Banter Club",
                 date: Date(),
                 view: AnyView(BanterClub())),
        Escapade(name: "Border Radius Calculator",
                 date: Date(),
                 view: AnyView(BorderRadiusCalculator()))
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(escapades) { escapade in
                    NavigationLink(destination: escapade.view) {
                        VStack(alignment: .leading) {
                            Text(escapade.name)
                                .font(.headline)
                            Text(escapade.date, style: .date)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Escapades")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
