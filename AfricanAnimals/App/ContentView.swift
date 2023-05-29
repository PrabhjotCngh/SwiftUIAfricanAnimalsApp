//
//  ContentView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let heptics = UIImpactFeedbackGenerator(style: .medium)
        
    //MARK: - Functions
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        // Toolbar Image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                        ForEach(animals) { animal in
                            NavigationLink(destination:
                                            AnimalDetailView(animal: animal)
                            ) {
                                AnimalListItemView(animal: animal)
                            } //: NavigationLink
                        } //: Loop
                        
                        CreditsView().modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                } //: NavigationLink
                            } //: Loop
                        } //: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    } //: ScrollView
                } //: Conditional
            } //: Group
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                            isGridViewActive = false
                            heptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        Button {
                            isGridViewActive = true
                            heptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }


                    } //: HStack
                } //: ToolbarItem
            } //: Toolbar
        } //: NavigationView
        .navigationSplitViewStyle(.prominentDetail)
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
