//
//  DetailViewModel.swift
//  TravelVista
//
//  Created by Margot Pasquali on 20/11/2024.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var countryName: String
    @Published var capitalName: String
    @Published var ratings: Int

    init(country: Country?) {
        self.countryName = country?.name ?? "Country"
        self.capitalName = country?.capital ?? "Capital"
        self.ratings = country?.rate ?? 0
    }
}
