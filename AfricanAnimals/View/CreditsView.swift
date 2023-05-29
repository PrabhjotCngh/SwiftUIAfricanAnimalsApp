//
//  CreditsView.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-29.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
                 Copyright © Prabhjot Singh
                 All rights reserved
                 Better Apps ♡ Less Code
                 """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
        
    }
}

//MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
