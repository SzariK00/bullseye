//
//  Shapes.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 08/04/2021.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .animation(.easeOut)
            }
            Rectangle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: wideShapes ? 100 : 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .animation(.easeOut)
            Button(action: {
                wideShapes.toggle()
            }) {
                Text("Animate!")
            }
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
