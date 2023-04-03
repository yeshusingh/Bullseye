//
//  TextViews.swift
//  Bullseye
//
//  Created by Yeshu Singh on 4/1/23.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .kerning(2.0)
        
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction")
            BigNumberText(text: "999")
            SliderLabelText(text: "100").padding(30)
            LabelText(text: "Score").padding(20)
            BodyText(text: "You scored 200 Points\n🎉🎉🎉").padding(20)
            ButtonText(text: "Start New Round")
            ScoreText(score: 459).padding()
            DateText(date: Date())
            BigBoldText(text: "LEADERBOARD")
        }
        .padding()
    }
}
