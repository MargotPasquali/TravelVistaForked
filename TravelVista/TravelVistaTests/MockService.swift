//
//  MockService.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import Foundation
@testable import TravelVista

enum MockServiceError: Error {
    case malformedData
    case unsupportedType
}

class MockService: Service {
        // Mock des données simulées
    var mockRegions: [Region] = [
        Region(name: "Europe", countries: [
            Country(
                name: "Norvège",
                capital: "Oslo",
                description: "Un beau pays.",
                rate: 5,
                pictureName: "norvege",
                coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)
            ),
            Country(
                name: "Italie",
                capital: "Rome",
                description: "Un autre beau pays.",
                rate: 4,
                pictureName: "italie",
                coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
            )
        ]),
        Region(name: "Asie", countries: [
            Country(
                name: "Vietnam",
                capital: "Hanoi",
                description: "Un pays fascinant.",
                rate: 5,
                pictureName: "vietnam",
                coordinates: Coordinates(latitude: 35.6895, longitude: 139.6917)
            )
        ])
    ]

    // Indicateur pour retourner des données mal formées
    var shouldReturnMalformedData = false

    override func load<T>(_ filename: String) throws -> T where T: Decodable {
        if shouldReturnMalformedData {
            throw MockServiceError.malformedData
        }

        if T.self == [Region].self {
            return mockRegions as! T
        }

        throw MockServiceError.unsupportedType
    }

}
