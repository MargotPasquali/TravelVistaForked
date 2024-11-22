//
//  ModelTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista

final class CoordinatesTests: XCTestCase {
    
    func testCoordinatesInitialization() {
        let coordinates = Coordinates(latitude: 41.9028, longitude: 12.4964)
        
        XCTAssertEqual(coordinates.latitude, 41.9028, "La latitude devrait être correctement initialisée.")
        XCTAssertEqual(coordinates.longitude, 12.4964, "La longitude devrait être correctement initialisée.")
    }

    func testCoordinatesDecoding() {
        let json = """
        {
            "latitude": 41.9028,
            "longitude": 12.4964
        }
        """.data(using: .utf8)!

        let coordinates = try? JSONDecoder().decode(Coordinates.self, from: json)
        XCTAssertNotNil(coordinates, "Les coordonnées devraient être décodées correctement.")
        XCTAssertEqual(coordinates?.latitude, 41.9028, "La latitude devrait être 41.9028.")
        XCTAssertEqual(coordinates?.longitude, 12.4964, "La longitude devrait être 12.4964.")
    }

    func testCoordinatesEncoding() {
        let coordinates = Coordinates(latitude: 41.9028, longitude: 12.4964)
        
        let jsonData = try? JSONEncoder().encode(coordinates)
        XCTAssertNotNil(jsonData, "Les coordonnées devraient être encodées en JSON.")

        let jsonString = String(data: jsonData!, encoding: .utf8)
        XCTAssertNotNil(jsonString, "La conversion en chaîne JSON devrait réussir.")
        XCTAssertTrue(jsonString!.contains("\"latitude\":41.9028"), "Le JSON devrait contenir la latitude.")
        XCTAssertTrue(jsonString!.contains("\"longitude\":12.4964"), "Le JSON devrait contenir la longitude.")
    }
}
