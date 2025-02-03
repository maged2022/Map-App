//
//  LocationPreviewView.swift
//  Map-App
//
//  Created by maged on 06/09/2023.
//

import SwiftUI

struct LocationPreviewView: View {
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        HStack(alignment: .bottom) {
            VStack (alignment: .leading){
                Image(viewModel.currentLocation.imageNames.first!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100 , height: 100)
                    .border(.white, width: 5)
                    .cornerRadius(5)
                Text(viewModel.currentLocation.cityName)
                Text(viewModel.currentLocation.name)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Button {
                    viewModel.moveToNextRegion()
                } label: {
                    Text("Next")
                        .padding()
                    // .padding(.horizontal)
                        .background(.orange)
                        .cornerRadius(10)
                }
                
                Button {
                    //
                } label: {
                    Text("more detail")
                        .padding()
                    //.padding(.horizontal)
                        .background(.orange)
                        .cornerRadius(10)
                }
                
            }
            .frame(alignment: .bottom)
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .bottom)
        .background(
            RoundedRectangle(cornerSize: CGSize())
                .fill(.ultraThinMaterial)
                .offset(y:50)
        )
        .cornerRadius(10)
        .padding()
    }
}
