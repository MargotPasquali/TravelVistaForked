//
//  ListViewModel.swift
//  TravelVista
//
//  Created by Margot Pasquali on 21/11/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var regions: [Region] = []
    private let service: Service

    init(service: Service = Service()) {
        self.service = service
        loadRegions()
    }

    func loadRegions() {
        do {
            regions = try service.load("Source.json")
        } catch {
            print("Erreur lors du chargement des régions : \(error.localizedDescription)")
            regions = [] // Valeur par défaut en cas d'erreur
        }
    }

}
