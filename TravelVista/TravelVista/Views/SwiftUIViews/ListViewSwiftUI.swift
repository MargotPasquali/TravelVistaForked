//
//  ListViewSwiftUI.swift
//  TravelVista
//
//  Created by Margot Pasquali on 20/11/2024.
//

import SwiftUI

struct ListViewSwiftUI: View {
    @ObservedObject var viewmodel: ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewmodel.regions, id: \.name) { region in
                    Section(header: Text(region.name)) {
                        ForEach(region.countries, id: \.name) { country in
                            ZStack {
                                // NavigationLink avec contenu invisible
                                NavigationLink(destination: DetailView(country: country)) {
                                    EmptyView()
                                }
                                .opacity(0) // Masque le lien visuellement
                                
                                // Contenu personnalisé visible
                                ListRowViewSwiftUI(country: country)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Liste de Voyages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ListViewSwiftUI(viewmodel: ListViewModel())
}
