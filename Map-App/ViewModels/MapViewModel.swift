//
//  MapViewModel.swift
//  Map-App
//
//  Created by maged on 06/09/2023.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var toggleMenuButton: Bool = false
    let span =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var currentLocation: Location {
        didSet {
            mapRegion = MKCoordinateRegion(center: currentLocation.coordinates, span: span)
        }
    }
    
    init() {
        
        let locations = LocationsDataService.locations
        currentLocation = locations.first!
        self.getData()
       
    }
    
    // get our data
    func getData() {
        locations =  LocationsDataService.locations
        mapRegion = MKCoordinateRegion(center: locations.first!.coordinates, span: span)
    }
    
    // updating region when selcting from menu
    func updatingRegeion(location: Location) {
        currentLocation = location
        toggleMenuButton = false
    }
    
    // Function to move to the next region and loop back to the beginning if at the end
       func moveToNextRegion() {
           if let currentIndex = locations.firstIndex(where: { $0 == currentLocation }) {
               let nextIndex = (currentIndex + 1)
               
               guard locations.indices.contains(nextIndex) else {
                   
                   // invalide location
                   updatingRegeion(location: locations[0])
                   return
                   
               }
               updatingRegeion(location: locations[nextIndex])
            
           }
       }
    
}
