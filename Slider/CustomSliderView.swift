//
//  CustomSliderView.swift
//  Slider
//
//  Created by Dmitrii Onegin on 20.02.2022.
//

import SwiftUI

struct CustomSliderView: View {
    
    @Binding var value: Double
    @Binding var valueString: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Text(String(format: "%.2f", value))
                .foregroundColor(.white)
                .frame(width: 60)
            
            Slider(value: $value, in: 0 ... 1){ _ in
                valueString = String(format: "%.2f", value)
            }
            .accentColor(color)
            
            TextField("", text: $valueString, onCommit: {
                value = Double(valueString) ?? 0
            })
                .keyboardType(.numbersAndPunctuation)
                .submitLabel(.done)
                .padding(10)
                .frame(width: 60)
                .background().cornerRadius(15)
        }
    }
}

