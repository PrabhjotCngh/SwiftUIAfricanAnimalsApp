//
//  CenterModifier.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-29.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
