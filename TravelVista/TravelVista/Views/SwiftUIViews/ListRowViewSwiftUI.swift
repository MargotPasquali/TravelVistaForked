//
//  ListRowViewSwiftUI.swift
//  TravelVista
//
//  Created by Margot Pasquali on 21/11/2024.
//

import SwiftUI

struct ListRowViewSwiftUI: View {
    let country: Country
    
    var body: some View {
        HStack {
            Image(country.pictureName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 52, height: 52)
            VStack(alignment: .leading) {
                Text(country.name)
                    .foregroundStyle(Color("CustomBlue"))
                    .font(.system(size: 22, weight: .medium, design: .default))
                Text(country.capital)
                    .foregroundColor(Color(UIColor.darkGray))
                    .font(.system(size: 17, weight: .regular, design: .default))
            }
            Spacer()
            Text(String(country.rate))
            Image(systemName: "star.fill")
                .foregroundStyle(Color("CustomSand"))
        }
    }
}

extension Country {
    static var preview: Country {
        Country(
            name: "Canada",
            capital: "Ottawa",
            description: "A beautiful country with diverse culture.",
            rate: 4,
            pictureName: "canada",
            coordinates: Coordinates(latitude: 45.4215, longitude: -75.6972)
        )
    }
}

#Preview {
    ListRowViewSwiftUI(country: Country.preview)
}
