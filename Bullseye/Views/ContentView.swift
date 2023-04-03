//
//  ContentView.swift
//  Bullseye
//
//  Created by Yeshu Singh on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .zIndex(1)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as possible to")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
                .frame(width: 35)
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        Button("Hit Me".uppercased()) {
            withAnimation {
                alertIsVisible = true
            }
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(.white, lineWidth: Constants.General.strokeWidth)
        )
        .foregroundColor(.white)
        .bold()
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .font(.title3)
//        .alert(
//            "Hi There",
//            isPresented: $alertIsVisible,
//            actions: {
//                Button("Awesome") {
//                    game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
//                }
//            },
//            message: {
//                let roundedValue = Int(sliderValue.rounded())
//                Text("""
//                The slider value is : \(roundedValue)
//                You scored \(game.points(sliderValue: roundedValue)) points this round.
//                """)
//            }
//        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}


