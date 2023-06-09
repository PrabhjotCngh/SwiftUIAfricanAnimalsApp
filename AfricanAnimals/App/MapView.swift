//
//  MapView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
        //MARK: - Basic Map
        //Map(coordinateRegion: $region)
        
        //MARK: - Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // 1. Pin: Old style(always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // 2. Marker: New style(always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // 3. Custom basic annotation(it could be interactive)
            //MapAnnotation(coordinate: item.location) {
            //    Image("logo")
            //        .resizable()
            //        .scaledToFit()
            //        .frame(width: 32, height: 32, alignment: .center)
            //}
            
            // 4. Complex map annotation(it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay(
            HStack(alignment:.center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment:.leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Logitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
        )
    }
}

//MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
