//
//  AppColorTheme.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

protocol AppColorThemeProtocol {
    //settings
    var appThemesCount : Int { get }
    var colorThemePickerIndex : Int { get }
    var appThemeNames : [String] { get }
    //current colors
    var accent: Color { get }
    var background: Color { get }
    var text: Color { get }
    var secondaryText: Color { get }
    var markerColor: Color { get }
}

class AppColorTheme : ObservableObject, AppColorThemeProtocol {
    
    struct ColorTheme {
        let name: String
        let accent: Color
        let background: Color
        let text: Color
        let secondaryText: Color
        let markerColor: Color
    }
    //colors
    var accent: Color {
        currentTheme.accent
    }
    
    var background: Color {
        currentTheme.background
    }
    
    var text: Color {
        currentTheme.text
    }
    
    var secondaryText: Color {
        currentTheme.secondaryText
    }
    
    var markerColor: Color {
        currentTheme.markerColor
    }
    
    //private
    private let appThemes : [ColorTheme]
    
    private var currentTheme : ColorTheme {
        appThemes[colorThemePickerIndex]
    }
    
    // settings
    @Published var colorThemePickerIndex : Int = 0
    
    var appThemeNames: [String]
    
    var appThemesCount : Int {
        appThemes.count
    }

    
    init() {
        let redTheme = ColorTheme(name: "Red", accent: Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), background: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), text: Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        let greenTheme = ColorTheme(name: "Green", accent: Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), background: Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)), text: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        let blueTheme = ColorTheme(name: "Blue", accent: Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), background: Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)), text: Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        let grayTheme = ColorTheme(name: "gray", accent: Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)), background: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), text: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), secondaryText: Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)),  markerColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        appThemes = [grayTheme, redTheme, greenTheme, blueTheme]
        appThemeNames = appThemes.map({ theme in
            theme.name
        })
    }
    
    
}
