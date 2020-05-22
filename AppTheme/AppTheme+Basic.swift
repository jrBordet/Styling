//
//  AppTheme+Basic.swift
//  AppThemeDemo
//
//  Created by Jean Raphael Bordet on 19/05/2020.
//  Copyright © 2020 Jean Raphael Bordet. All rights reserved.
//

import UIKit

// https://material.io/design/color/the-color-system.html#color-theme-creation
// https://www.color-hex.com/color/000000

extension UIColor {
    static func color(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return light
        }
        
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            guard UITraitCollection.userInterfaceStyle == .dark else {
                return light
            }
            
            return dark
        }
    }
    
    // The color displayed most frequently across your app’s screens and components.
    public static var primaryColor: UIColor {
        UIColor.color(
            light: Color(hex: "#6200EE")?.systemColor ?? .black,
            dark: Color(hex: "#6200EE")?.inverted().systemColor ?? .black
        )
    }
    
    // A light or dark variation of the primary color.
    public static var primaryColorVariant: UIColor {
        UIColor.color(
            light: Color(hex: "#3700B3")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#3700B3")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // Provides ways to accent and distinguish your product. Floating action buttons use the secondary color.
    public static var secondaryColor: UIColor {
        UIColor.color(
            light: Color(hex: "#03DAC6")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#03DAC6")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    public static var secondaryColorVariant: UIColor {
        UIColor.color(
            light: Color(hex: "#018786")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#018786")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // The indication of errors within components such as text fields.
    public static var errorColor: UIColor {
        UIColor.color(
            light: Color(hex: "#b00200")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#b00200")?.systemColor ?? UIColor.black
        )
    }
    
    // Typically maps to the background of components such as cards, sheets, and dialogs.
    public static var surfaceColor: UIColor {
        UIColor.color(
            light: Color(hex: "#eee")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#eee")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // Typically found behind scrollable content.
    public static var backgroundColor: UIColor {
        UIColor.color(
            light: Color(hex: "#c9c9c9")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#c9c9c9")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // MARK: - On color
    
    // Text/iconography drawn on top of primaryColor.
    public static var onPrimaryColor: UIColor {
        UIColor.color(
            light: Color(hex: "#FFFFFF")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#FFFFFF")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // Text/iconography drawn on top of secondaryColor.
    public static var onSecondaryColor: UIColor {
        UIColor.color(
            light: Color(hex: "#000000")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#000000")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // Text/iconography drawn on top of errorColor.
    public static var onErrorColor: UIColor {
        UIColor.color(
            light: Color(hex: "#FFF")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#FFF")?.systemColor ?? UIColor.black
        )
    }
    
    // Text/iconography drawn on top of surfaceColor.
    public static var onSurfaceColor: UIColor {
        UIColor.color(
            light: Color(hex: "#000000")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#000000")?.inverted().systemColor ?? UIColor.black
        )
    }
    
    // Text/iconography drawn on top of backgroundColor.
    public static var onBackgroundColor: UIColor {
        UIColor.color(
            light: Color(hex: "#000000")?.systemColor ?? UIColor.black,
            dark: Color(hex: "#000000")?.inverted().systemColor ?? UIColor.black
        )
    }
}
