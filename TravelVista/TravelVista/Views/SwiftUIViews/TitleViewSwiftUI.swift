//
//  TitleViewSwiftUI.swift
//  TravelVista
//
//  Created by Margot Pasquali on 20/11/2024.
//

import SwiftUI

struct TitleViewSwiftUI: View {
    @ObservedObject var viewModel: DetailViewModel

    // MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.countryName)
                        .foregroundStyle(Color("CustomBlue"))
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 10.0)
                
                HStack {
                    Text(viewModel.capitalName)
                        .foregroundColor(Color(UIColor.darkGray))
                        .font(.system(size: 17, weight: .regular, design: .default))

                    Spacer()
                }
                .padding(.leading, 10.0)
                
            }
                ForEach(0..<viewModel.ratings, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundColor(.yellow)
                }
        }    .padding(.trailing, 10.0)
    }
}
//#Preview {
//    let mockCountry = Country(
//        name: "Italie",
//        capital: "Rome",
//        pictureName: "italy",
//        description: "Un magnifique pays connu pour son histoire.",
//        rate: 4, // Exemple : 4 étoiles
//        coordinates:(latitude: 41.9028, longitude: 12.4964)
//    )
//    TitleViewSwiftUI(viewModel: DetailViewModel(country: mockCountry))
//}
//
//
