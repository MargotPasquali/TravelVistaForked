//
//  ListViewModelTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista

final class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var mockService: MockService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Instancier un mock de Service
        mockService = MockService()
        
        // Injecter le mock dans le ListViewModel
        viewModel = ListViewModel(service: mockService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockService = nil
        try super.tearDownWithError()
    }

    func testLoadRegionsSuccessfully() {
        // Charger les régions via le ViewModel
        viewModel.loadRegions()

        // Vérifier que les régions ont été chargées correctement
        XCTAssertEqual(viewModel.regions.count, 2, "Le nombre de régions chargées devrait être 2.")

        // Vérifier les détails d'une région
        let region = viewModel.regions.first
        XCTAssertEqual(region?.name, "Europe", "Le nom de la première région devrait être 'Europe'.")
        XCTAssertEqual(region?.countries.count, 2, "La première région devrait contenir 2 pays.")

        // Vérifier les détails d'un pays
        let country = region?.countries.first
        XCTAssertEqual(country?.name, "Norvège", "Le premier pays devrait être 'Norvège'.")
        XCTAssertEqual(country?.capital, "Oslo", "La capitale de la France devrait être 'Oslo'.")
    }

    func testLoadRegionsWithEmptyData() {
        // Injecter des données vides
        mockService.mockRegions = []
        viewModel.loadRegions()

        // Vérifier que regions est vide
        XCTAssertEqual(viewModel.regions.count, 0, "Le tableau regions devrait être vide.")
    }

    func testLoadRegionsWithMalformedData() {
        let mockService = MockService()
        mockService.shouldReturnMalformedData = true

        do {
            let _ = try mockService.load("Source.json") as [Region]
            XCTFail("L'appel à load aurait dû lever une erreur pour des données mal formées.")
        } catch MockServiceError.malformedData {
            // Succès, c'est l'erreur attendue
        } catch {
            XCTFail("Une erreur inattendue a été levée : \(error).")
        }
    }

}
