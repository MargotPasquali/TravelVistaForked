//
//  DetailViewControllerTests.swift
//  TravelVistaTests
//
//  Created by Margot Pasquali on 22/11/2024.
//

import XCTest
@testable import TravelVista
import MapKit

class DetailViewControllerTests: XCTestCase {
    var viewmodel: DetailViewController!
    var storyboard: UIStoryboard!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Charger le storyboard et instancier le ViewController
        storyboard = UIStoryboard(name: "Main", bundle: .main)
        viewmodel = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        viewmodel.loadViewIfNeeded() // Charge la vue sans lancer tout le cycle de vie
    }
    
    override func tearDownWithError() throws {
        viewmodel = nil
        storyboard = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func testViewControllerInitialization() {
        XCTAssertNotNil(viewmodel, "Le ViewController ne devrait pas être nil.")
        XCTAssertNotNil(viewmodel.view, "La vue du ViewController devrait être chargée.")
    }
    
    func testSetUpData_withValidCountry() {
        // Préparer un mock de Country
        let country = Country(
            name: "Italie",
            capital: "Rome",
            description: "Un beau pays.",
            rate: 5,
            pictureName: "italie",
            coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)
        )
        viewmodel.country = country
        
        // Appeler la méthode à tester
        viewmodel.setUpData(country: country)
        
        // Vérifier que les valeurs sont bien configurées
        XCTAssertEqual(viewmodel.title, "Italie")
        XCTAssertEqual(viewmodel.descriptionTextView.text, "Un beau pays.")
        XCTAssertNotNil(viewmodel.imageView.image, "L'image devrait être configurée.")
    }
    
    func testSetUpData_CallsSetMapLocation() {
        // Préparer un mock de Country
        let country = Country(
            name: "Italie",
            capital: "Rome",
            description: "Un beau pays.",
            rate: 5,
            pictureName: "italie",
            coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)
        )
        viewmodel.country = country
        
        // Appeler la méthode à tester
        viewmodel.setUpData(country: country)
        
        // Vérifier que la région de la carte est bien configurée
        let region = viewmodel.mapView.region
        XCTAssertEqual(region.center.latitude, 41.9028, accuracy: 0.0001, "La latitude de la région devrait correspondre à celle du pays.")
        XCTAssertEqual(region.center.longitude, 12.4964, accuracy: 0.0001, "La longitude de la région devrait correspondre à celle du pays.")
    }

    func testSetUpData_withMissingImage() {
        // Préparer un mock de Country sans image valide
        let country = Country(
            name: "Unknown",
            capital: "Nowhere",
            description: "Un endroit mystérieux.",
            rate: 0,
            pictureName: "missing_image", // Image qui n'existe pas
            coordinates: Coordinates(latitude: 0.0, longitude: 0.0)
        )
        viewmodel.country = country
        
        // Appeler la méthode à tester
        viewmodel.setUpData(country: country)
        
        // Test de l'image
        XCTAssertNil(viewmodel.imageView.image, "Aucune image ne devrait être configurée pour une image manquante.")
    }
    
    func testSetMapLocation() {
        // Appeler la méthode avec des coordonnées fictives
        viewmodel.setMapLocation(lat: 48.8566, long: 2.3522)
        
        // Vérifier que le centre de la région correspond aux coordonnées spécifiées
        let region = viewmodel.mapView.region
        XCTAssertEqual(region.center.latitude, 48.8566, accuracy: 0.0001)
        XCTAssertEqual(region.center.longitude, 2.3522, accuracy: 0.0001)
    }
    
    func testCustomDesignIsApplied() {
        // Appeler la méthode
        viewmodel.setCustomDesign()
        
        // Vérifier les styles appliqués
        XCTAssertEqual(viewmodel.mapView.layer.cornerRadius, viewmodel.mapView.frame.size.width / 2)
        XCTAssertEqual(viewmodel.mapView.layer.borderWidth, 2.0)
        XCTAssertNotNil(viewmodel.mapView.layer.borderColor)
    }
    
}
