//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Дарина Самохина on 10.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonLabel = "START"

    @State private var redLight = LightCircleView(color: Color.red, opacity: 0.2)
    @State private var yellowLight = LightCircleView(color: Color.yellow, opacity: 0.2)
    @State private var greenLight = LightCircleView(color: Color.green, opacity: 0.2)

    var body: some View {
        
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                redLight
                yellowLight
                greenLight
                
                Spacer()
                
                Button(action: { startButtonDidPressed() }) {
                    Text("\(buttonLabel)")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(maxWidth: 150)
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 3).foregroundColor(.white))
                .padding(.bottom, 20)
            }
            
        }
    
    }
    
    private func startButtonDidPressed() {
        if buttonLabel == "START" {
            buttonLabel = "NEXT"
        }
        
        if yellowLight.opacity == 0.2 && greenLight.opacity == 0.2 && redLight.opacity == 0.2 {
            redLight.opacity = 1
        } else if redLight.opacity == 1 {
            redLight.opacity = 0.2
            yellowLight.opacity = 1
        } else if yellowLight.opacity == 1 {
            yellowLight.opacity = 0.2
            greenLight.opacity = 1
        } else {
            redLight.opacity = 1
            greenLight.opacity = 0.2
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .previewDevice("iPhone SE")
    }
}
