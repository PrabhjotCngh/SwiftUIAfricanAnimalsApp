//
//  ContentView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
                ForEach(animals) { animal in
                    NavigationLink(destination:                     AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    }
                }
            } //: List
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } //: NavigationView
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
