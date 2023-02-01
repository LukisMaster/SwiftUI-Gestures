//
//  ColorExtension.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 21.11.2022.
//

import SwiftUI

// MARK: -Color of target faces
extension Color {
    static let yellowWA = Color(#colorLiteral(red: 1, green: 0.9365435243, blue: 0, alpha: 1))
    static let redWA = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
    static let blueWA = Color(#colorLiteral(red: 0, green: 0.8351101279, blue: 1, alpha: 1))
    static let blackWA = Color(#colorLiteral(red: 0.05655267835, green: 0.05655267835, blue: 0.05655267835, alpha: 1))
    static let whiteWA = Color(#colorLiteral(red: 0.9601849914, green: 0.9601849914, blue: 0.9601849914, alpha: 1))
    static let grayBorderWA = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))

}

// MARK: -Color for App UI
extension Color {
    struct ColorTheme {
        let accent: Color
        let background: Color
        let text: Color
        let secondaryText: Color
        let markerColor: Color
    }
    
    enum AppThemes: String, CaseIterable {
        case red = "Red"
        case green = "Green"
        case blue = "Blue"
        case gray = "Gray"
    }
    
    static var appThemeOption : AppThemes = .gray {
        didSet {
            switch appThemeOption {
            case .red:
                Color.appTheme = redTheme
            case .green:
                Color.appTheme = greenTheme
            case .blue:
                Color.appTheme = blueTheme
            case .gray:
                Color.appTheme = grayTheme

            }
        }
    }
    
    static var appTheme : ColorTheme = grayTheme
    
    private static let redTheme = ColorTheme(accent: Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), background: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), text: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
    private static let greenTheme = ColorTheme(accent: Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), background: Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)), text: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
    private static let blueTheme = ColorTheme(accent: Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), background: Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)), text: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
    private static let grayTheme = ColorTheme(accent: Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)), background: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), text: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
}

