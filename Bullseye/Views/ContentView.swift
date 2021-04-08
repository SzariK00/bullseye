//
//  ContentView.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 27/03/2021.
//

import SwiftUI

struct ContentView: View {
    //Jak zmienia się zawartość zmiennej State, SwiftUI przetwarza body widoku. Private oznacza, że jest to zmienna prywatna danej klasy/struct.
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game, sliderValue: $sliderValue)
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
            VStack {
                InstructionsView(game: $game, alertIsVisible: $alertIsVisible)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
                .padding(.bottom, 10.0)
            BigNumberText(text: String(game.target))
        }
        .padding(.bottom, alertIsVisible ? 0 : 100)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) { 
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
