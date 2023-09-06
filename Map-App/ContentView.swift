
import Foundation
import MapKit
import SwiftUI



struct MapView: View {
    @ObservedObject var viewModel = MapViewModel()
    
    var body: some View {
        ZStack {
            // map
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
            
            // Button menu
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        viewModel.toggleMenuVisibility()
                    }
                }) {
                    HStack {
                        Image(systemName: viewModel.isMenuVisible ? "arrow.down" : "arrow.up")
                            .foregroundColor(.black)
                            .padding()
                        
                        Text("Next City: \(LocationsDataService.locations[viewModel.selectedCityIndex].cityName)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .padding(.horizontal)
                    .padding(.top)
                   // .background(.red)
                }
                
                // Menu
                // Display the list of city names when the menu is visible
                if viewModel.isMenuVisible {
                    
                    List(LocationsDataService.locations.indices, id: \.self) { index in
                        Text(LocationsDataService.locations[index].cityName)
                            .background(.blue)
                            .onTapGesture {
                                viewModel.selectCity(index)
                                viewModel.toggleMenuVisibility()
                            }
                    }
                    .listStyle(.plain) // Set list style to plain
                    .background(Color.clear) // Set the background color to clear
                    .padding(.horizontal)
                    Spacer()
                }
                
                
                
                Spacer()
            }
        }
    }
}

// ... Rest of your code ...

class MapViewModel: ObservableObject {
    @Published var selectedCityIndex: Int = 0
    @Published var region = MKCoordinateRegion(
        center: LocationsDataService.locations[0].coordinates,
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @Published var isMenuVisible: Bool = false // Track menu visibility
    
    func toggleMenuVisibility() {
        isMenuVisible.toggle()
    }
    
    func selectCity(_ index: Int) {
        selectedCityIndex = index
        region.center = LocationsDataService.locations[index].coordinates
    }
}


struct ContentView: View {
    var body: some View {
        MapView()
    }
}



