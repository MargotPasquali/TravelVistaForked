//
//  MapViewControllerTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
import MapKit
@testable import TravelVista

final class MapViewControllerTests: XCTestCase {
    var mapViewController: MapViewController!
    var storyboard: UIStoryboard!

    override func setUpWithError() throws {
        try super.setUpWithError()

        // Charger le storyboard et instancier le ViewController
        storyboard = UIStoryboard(name: "Main", bundle: .main)
        mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        mapViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        mapViewController = nil
        storyboard = nil
        try super.tearDownWithError()
    }

    func testViewControllerInitialization() {
        XCTAssertNotNil(mapViewController, "Le ViewController ne devrait pas être nil.")
        XCTAssertNotNil(mapViewController.mapView, "L'outlet mapView devrait être connecté.")
    }

    func testSetUpDataConfiguresPropertiesCorrectly() {
        // Appeler setUpData avec des données fictives
        mapViewController.setUpData(capitalName: "Oslo", lat: 48.8566, long: 2.3522)
        
        // Vérifier que les propriétés sont correctement configurées
        XCTAssertEqual(mapViewController.capitalName, "Oslo", "Le nom de la capitale devrait être 'Paris'.")
        XCTAssertEqual(mapViewController.coordinates?.latitude, 48.8566, "La latitude devrait être configurée correctement.")
        XCTAssertEqual(mapViewController.coordinates?.longitude, 2.3522, "La longitude devrait être configurée correctement.")
    }

    func testViewDidLoadConfiguresMapCorrectly() {
        // Configurer les données initiales
        mapViewController.setUpData(capitalName: "Rome", lat: 41.9028, long: 12.4964)

        // Charger la vue
        mapViewController.viewDidLoad()
        
        // Vérifier que la région de la carte est configurée
        let region = mapViewController.mapView.region
        XCTAssertEqual(region.center.latitude, 41.9028, accuracy: 0.0001, "La latitude du centre devrait correspondre à celle de Rome.")
        XCTAssertEqual(region.center.longitude, 12.4964, accuracy: 0.0001, "La longitude du centre devrait correspondre à celle de Rome.")

        // Vérifier que l'annotation est ajoutée
        XCTAssertEqual(mapViewController.mapView.annotations.count, 1, "Il devrait y avoir une annotation sur la carte.")
        let annotation = mapViewController.mapView.annotations.first as? MKPointAnnotation
        XCTAssertEqual(annotation?.title, "Rome", "Le titre de l'annotation devrait être 'Rome'.")
        XCTAssertEqual(annotation?.coordinate.latitude, 41.9028, "La latitude de l'annotation devrait correspondre à celle de Rome.")
        XCTAssertEqual(annotation?.coordinate.longitude, 12.4964, "La longitude de l'annotation devrait correspondre à celle de Rome.")
    }
}
