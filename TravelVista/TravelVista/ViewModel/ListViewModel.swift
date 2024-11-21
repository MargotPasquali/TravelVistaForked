//
//  ListViewModel.swift
//  TravelVista
//
//  Created by Margot Pasquali on 21/11/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var regions: [Region] = []
    
    init() {
        loadRegions()
    }

    private func loadRegions() {
        let service = Service()
        regions = service.load("Source.json") // Charge les régions depuis le JSON
    }
}
