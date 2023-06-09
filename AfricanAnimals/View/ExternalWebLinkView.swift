//
//  ExternalWebLinkView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - Properties
    let animal: Animal

    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org")!)

                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            } //: HStack
        } //: GroupBox
    }
}

//MARK: - Preview
struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
