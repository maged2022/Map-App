//
//  LocationListView.swift
//  Map-App
//
//  Created by maged on 06/09/2023.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                HStack {
                    Image(location.imageNames.first!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50 , height: 50)
                    VStack (alignment: .leading){
                        Text(location.cityName)
                            .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .leading)
                        
                        Text(location.name)
                            .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .leading)
                    }
                }
                .background(.ultraThinMaterial)
                .onTapGesture {
                    viewModel.updatingRegeion(location: location)
                }
            }
            
            
        }
        .listStyle(.plain) // Set list style to plain
        .background(Color.clear) // Set the background color to clear
        .padding(.horizontal)
    }
}
