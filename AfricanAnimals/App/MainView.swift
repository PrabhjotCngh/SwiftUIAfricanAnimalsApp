//
//  MainView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI

struct MainView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        } //: TabView
    }
}

//MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
