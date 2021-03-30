//
//  TextViews.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 30/03/2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText(text: "Instructions")
    }
}
