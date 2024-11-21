//
//  DetailView.swift
//  TravelVista
//
//  Created by Margot Pasquali on 21/11/2024.
//

import SwiftUI

struct DetailView: UIViewControllerRepresentable {
    let country: Country
    
    func makeUIViewController(context: Context) -> DetailViewController {
        guard let detailVC = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("DetailViewController introuvable dans le storyboard.")
        }

        detailVC.country = country
        return detailVC
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
