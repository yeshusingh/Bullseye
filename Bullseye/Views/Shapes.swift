//
//  Shapes.swift
//  Bullseye
//
//  Created by Yeshu Singh on 4/1/23.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                //.fill(Color.blue)
                //.inset(by: 10)
                //.stroke(Color.purple, lineWidth: 20)
                    .strokeBorder(.purple, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.scale)
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
                //.animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            
            Ellipse()
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            
            Button("Animate") {
                withAnimation {
                    wideShapes.toggle()
                }
            }
            .padding()
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
