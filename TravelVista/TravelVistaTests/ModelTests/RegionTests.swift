//
//  RegionTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista

final class RegionTests: XCTestCase {
    
    func testRegionInitialization() {
        let region = Region(
            name: "Europe",
            countries: [
                Country(
                    name: "Italie",
                    capital: "Rome",
                    description: "Un pays riche en histoire et en culture.",
                    rate: 5,
                    pictureName: "italie",
                    coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
                )
            ]
        )

        XCTAssertEqual(region.name, "Europe", "Le nom de la région devrait être 'Europe'.")
        XCTAssertEqual(region.countries.count, 1, "La région devrait contenir 1 pays.")
        XCTAssertEqual(region.countries.first?.name, "Italie", "Le premier pays devrait être 'Italie'.")
    }

    func testRegionDecoding() {
        let json = """
        {
            "name": "Europe",
            "countries": [
                {
                    "name": "Italie",
                    "capital": "Rome",
                    "description": "Un pays riche en histoire et en culture.",
                    "rate": 5,
                    "pictureName": "italie",
                    "coordinates": {
                        "latitude": 41.9028,
                        "longitude": 12.4964
                    }
                }
            ]
        }
        """.data(using: .utf8)!

        let region = try? JSONDecoder().decode(Region.self, from: json)
        XCTAssertNotNil(region, "La région devrait être décodée correctement.")
        XCTAssertEqual(region?.name, "Europe", "Le nom de la région devrait être 'Europe'.")
        XCTAssertEqual(region?.countries.first?.name, "Italie", "Le premier pays devrait être 'Italie'.")
    }

    func testRegionEncoding() {
        // Création de la région
        let region = Region(
            name: "Europe",
            countries: [
                Country(
                    name: "Italie",
                    capital: "Rome",
                    description: "Un pays riche en histoire et en culture.",
                    rate: 5,
                    pictureName: "italie",
                    coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
                )
            ]
        )

        // Encodage en JSON
        let jsonData = try? JSONEncoder().encode(region)
        XCTAssertNotNil(jsonData, "La région devrait être encodée en JSON.")

        // Décodage du JSON pour valider son contenu
        do {
            let decodedRegion = try JSONDecoder().decode(Region.self, from: jsonData!)
            XCTAssertEqual(decodedRegion.name, "Europe", "Le nom de la région devrait être 'Europe'.")
            XCTAssertEqual(decodedRegion.countries.count, 1, "La région devrait contenir un pays.")
            XCTAssertEqual(decodedRegion.countries.first?.name, "Italie", "Le pays encodé devrait être 'Italie'.")
        } catch {
            XCTFail("Le JSON encodé ne peut pas être décodé : \(error).")
        }
    }

}
