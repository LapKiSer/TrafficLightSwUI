//
//  ContentView.swift
//  TrafficLight
//
//  Created by Кирилл Лапковский on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var nameButton = "START"
    @State var currentLight = CurrentLight.red
    @State var redLight = 0.3
    @State var yellowLight = 0.3
    @State var greenLight = 0.3
    
    let opacityOff = 0.3
    let opacityOn = 1.0
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack() {
                VStack(spacing: 16) {
                    Circle()
                        .opacity(redLight)
                        .foregroundColor(.red)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    Circle()
                        .opacity(yellowLight)
                        .foregroundColor(.yellow)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    Circle()
                        .opacity(greenLight)
                        .foregroundColor(.green)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                }
                .frame(width: 150, height: 400)
                Spacer()
                Button(action: changeLight) {
                    Text(nameButton)
                        .font(.title)
                }
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                .clipShape(Capsule())
            }
            .padding()
        }
    }
    
    private func changeLight() {
        if nameButton == "START"{
            nameButton = "NEXT"
        }
        
        switch currentLight {
        case .red:
            redLight = opacityOn
            greenLight = opacityOff
            currentLight = .yellow
        case .yellow:
            redLight = opacityOff
            yellowLight = opacityOn
            currentLight = .green
        case .green:
            yellowLight = opacityOff
            greenLight = opacityOn
            currentLight = .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}
