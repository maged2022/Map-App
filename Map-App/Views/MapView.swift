//
//  MapView.swift
//  Map-App
//
//  Created by maged on 06/09/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel: MapViewModel = MapViewModel()
    
    var body: some View {
        ZStack {
            
            //1- map
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                MapMarker(coordinate: location.coordinates)
            }
            .ignoresSafeArea()
            
            VStack (spacing: 0){
                //2- button Menu
                menuButton
                
                // showing location list view
                if viewModel.toggleMenuButton {
                    LocationListView(viewModel: viewModel)
                }
                Spacer()
                
                //3- preview location
                LocationPreviewView(viewModel: viewModel)
            }
          
            
        }
    }
}

extension MapView {
    var menuButton: some View {
            Button(action: {
                withAnimation {
                    viewModel.toggleMenuButton.toggle()
                }
            }) {
                HStack {
                    Image(systemName: viewModel.toggleMenuButton ? "arrow.down" : "arrow.up")
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("Next City: \(viewModel.currentLocation.cityName)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .padding(.horizontal)
                .padding(.top)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


