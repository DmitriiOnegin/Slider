//
//  ColorView.swift
//  Slider
//
//  Created by Dmitrii Onegin on 20.02.2022.
//

import SwiftUI

struct ColorView: View {
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(color)
            .frame(height: UIScreen.main.bounds.height / 5)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.white, lineWidth: 5)
            )
    }
}

