//
//  RoundViews.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 01/04/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(Circle())
            .foregroundColor(Color("ButtonFilledBackgroundColor"))
        
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
                
            )
    }
}


struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
        }
    }
}


struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
