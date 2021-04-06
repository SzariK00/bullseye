//
//  PointsView.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 06/04/2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(game.target))
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            Button(action: {}) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}



struct PointsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PointsView(game: .constant(Game()))
        PointsView(game: .constant(Game()))
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(game: .constant(Game()))
            .preferredColorScheme(.dark)
        PointsView(game: .constant(Game()))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
