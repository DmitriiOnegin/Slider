//
//  ContentView.swift
//  Slider
//
//  Created by Dmitrii Onegin on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: [Double] = [0, 0, 0]
    @State private var valueString: [String] = ["0", "0", "0"]
    
    let colors: [Color] = [.red, .green, .blue]
    var color: Color {
        Color(UIColor(red: value[0], green:value[1], blue: value[2], alpha: 1))
    }
    
    var body: some View {
        
        ZStack{
            Color.gray
            VStack{
                ColorView(color: color)
                    .padding(.vertical, 100)
                ForEach (0 ..< value.count ) {index in
                    CustomSliderView(value: $value[index], valueString: $valueString[index], color: colors[index])
                }
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
