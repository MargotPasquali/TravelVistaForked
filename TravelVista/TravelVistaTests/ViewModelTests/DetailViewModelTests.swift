//
//  DetailViewModelTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista

class DetailViewModelTests: XCTestCase {
    // MARK: - Variables communes
    var viewModel: DetailViewModel!
    var testCountry: Country!

    override func setUp() {
        super.setUp()
        // Création de Country pour les tests
        testCountry = Country(
            name: "Italie",
            capital: "Rome",
            description: "Pays des croissants et de la Tour Eiffel.",
            rate: 5,
            pictureName: "italie",
            coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)
        )
    }

    override func tearDown() {
        // Nettoyage des variables après chaque test
        viewModel = nil
        testCountry = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testViewModelInitializationWithCountry() {
        // Initialisation avec un Country
        viewModel = DetailViewModel(country: testCountry)
        
        XCTAssertEqual(viewModel.countryName, "Italie")
        XCTAssertEqual(viewModel.capitalName, "Rome")
        XCTAssertEqual(viewModel.ratings, 5)
    }
    
    func testViewModelInitializationWithoutCountry() {
        // Initialisation avec nil
        viewModel = DetailViewModel(country: nil)
        
        XCTAssertEqual(viewModel.countryName, "Country") // Valeur par défaut
        XCTAssertEqual(viewModel.capitalName, "Capital") // Valeur par défaut
        XCTAssertEqual(viewModel.ratings, 0) // Valeur par défaut
    }
    
    func testRatingsConsistency() {
        // Teste que le nombre d'étoiles correspond bien à la note
        viewModel = DetailViewModel(country: testCountry)
        
        XCTAssertEqual(viewModel.ratings, 5)
        
        // Modifie la note pour simuler un changement
        viewModel.ratings = 3
        XCTAssertEqual(viewModel.ratings, 3)
    }
}
