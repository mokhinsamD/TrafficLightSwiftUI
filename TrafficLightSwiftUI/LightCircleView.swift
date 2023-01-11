//
//  LightCircleView.swift
//  TrafficLightSwiftUI
//
//  Created by Дарина Самохина on 10.01.2023.
//

import SwiftUI

struct LightCircleView: View, Equatable {
    
    let color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(lineWidth: 4).foregroundColor(.white))
            .padding(.top, 10)
    }
}

struct LightCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LightCircleView(color: Color.red, opacity: 1)
    }
}
