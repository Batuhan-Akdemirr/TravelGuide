//
//  ColorExtension.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 7.01.2024.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    
    static var customOrange: Color {
        
        let color =  UIColor(hue: 0.0889, saturation: 1, brightness: 1, alpha: 1.0) 
        return Color(uiColor: color)
    }
    
   
    
}

