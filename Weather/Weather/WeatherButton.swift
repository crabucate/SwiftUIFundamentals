//
//  WeatherButton.swift
//  SwiftUI-Weather-SeanAllen
//
//  Created by Felix Leitenberger on 03.11.20.
//

import SwiftUI

struct WeatherButton: View {
    
    let title: String
    let textColor: Color
    var backgroundColor: Color
    
    var body: some View {
            Text(title)
                .frame(width: 280, height: 50, alignment: .center)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
}
}
