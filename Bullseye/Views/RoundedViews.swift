//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Yeshu Singh on 4/1/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLenth, height: Constants.General.roundedViewLenth)
            .overlay {
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLenth, height: Constants.General.roundedViewLenth)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.2)
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLenth, height: Constants.General.roundedViewLenth)
            .overlay {
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedRectTextView(text: "999").padding(40)
            RoundedTextView(text: "1")
        }
    }
}
struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
