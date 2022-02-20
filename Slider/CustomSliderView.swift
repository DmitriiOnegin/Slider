//
//  CustomSliderView.swift
//  Slider
//
//  Created by Dmitrii Onegin on 20.02.2022.
//

import SwiftUI

struct CustomSliderView: View {
    
    @State private var showAlert = false
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
                textFieldDidEndEditing()
            })
                .keyboardType(.numbersAndPunctuation)
                .submitLabel(.done)
                .padding(10)
                .frame(width: 60)
                .background().cornerRadius(15)
        }
        .alert("Не корректное значение", isPresented: $showAlert) {
            
        }
        
    }
    
    func textFieldDidEndEditing() {
        let newValue = Double(valueString) ?? 0
        switch newValue {
        case ..<0:
            value = 0
            valueString = "0"
            showAlert = true
        case 0 ... 1:
            value = Double(valueString) ?? 0
        default:
            value = 1
            valueString = "1"
            showAlert = true
        }
    }
}

