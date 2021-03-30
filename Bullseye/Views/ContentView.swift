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
            Color("BackgroudColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                Text(String(game.target))
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .kerning(-1)
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .foregroundColor(Color("TextColor"))
                        .bold()
                }
                .padding()
                Button(action: {
                    print("Hello, SwiftUI!")
                    alertIsVisible = true
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
                .cornerRadius(21)
                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("Hello there!"), message: Text("The slider value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome!")))
                })
            }
        }
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
