//
//  CountryTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista

final class CountryTests: XCTestCase {

    func testCountryInitialization() {
        let country = Country(
            name: "Italie",
            capital: "Rome",
            description: "Un pays riche en histoire et en culture.",
            rate: 5,
            pictureName: "italie",
            coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
        )

        XCTAssertEqual(country.name, "Italie", "Le nom du pays devrait être 'Italie'.")
        XCTAssertEqual(country.capital, "Rome", "La capitale devrait être 'Rome'.")
        XCTAssertEqual(country.description, "Un pays riche en histoire et en culture.", "La description devrait correspondre.")
        XCTAssertEqual(country.rate, 5, "Le taux devrait être 5.")
        XCTAssertEqual(country.pictureName, "italie", "Le nom de l'image devrait être 'italie'.")
        XCTAssertEqual(country.coordinates.latitude, 41.9028, "La latitude devrait correspondre.")
    }

    func testCountryDecoding() {
        let json = """
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
        """.data(using: .utf8)!

        let country = try? JSONDecoder().decode(Country.self, from: json)
        XCTAssertNotNil(country, "Le pays devrait être décodé correctement.")
        XCTAssertEqual(country?.name, "Italie", "Le nom devrait être 'Italie'.")
        XCTAssertEqual(country?.coordinates.latitude, 41.9028, "La latitude devrait être 41.9028.")
    }

    func testCountryEncoding() {
        let country = Country(
            name: "Italie",
            capital: "Rome",
            description: "Un pays riche en histoire et en culture.",
            rate: 5,
            pictureName: "italie",
            coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
        )

        let jsonData = try? JSONEncoder().encode(country)
        XCTAssertNotNil(jsonData, "Le pays devrait être encodé en JSON.")

        let jsonString = String(data: jsonData!, encoding: .utf8)
        XCTAssertNotNil(jsonString, "La conversion en chaîne JSON devrait réussir.")
        XCTAssertTrue(jsonString!.contains("\"name\":\"Italie\""), "Le JSON devrait contenir le nom 'Italie'.")
        XCTAssertTrue(jsonString!.contains("\"capital\":\"Rome\""), "Le JSON devrait contenir la capitale 'Rome'.")
    }
}
