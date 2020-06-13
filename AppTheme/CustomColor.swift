//
//  Color.swift
//  AppThemeDemo
//
//  Created by Jean Raphael Bordet on 20/05/2020.
//  Copyright © 2020 Jean Raphael Bordet. All rights reserved.
//

import CoreGraphics

/**
 *  Represents a color value type
 */
public struct CustomColor {
    
    /// Represents the underlying RGBA values
    public var rgba: RGBA
    
    public typealias RGBA = (red: Float, green: Float, blue: Float, alpha: Float)
    
    /**
     Initializes this color value with relative component values. e.g. (0.5, 0.2, 0.1, 1.0)
     
     - parameter red:   A value in the range 0...1
     - parameter green: A value in the range 0...1
     - parameter blue:  A value in the range 0...1
     - parameter alpha: A value in the range 0...1
     
     - returns: A new color value
     */
    public init(red: Float, green: Float, blue: Float, alpha: Float = 1) {
        func clamp(_ value: Float) -> Float {
            return min(1, max(0, value))
        }
        
        rgba = RGBA(red: clamp(red), green: clamp(green), blue: clamp(blue), alpha: clamp(alpha))
    }
    
    /**
     Returns a new color value with the associated alpha value
     
     - parameter alpha: The new alpha value
     
     - returns: A new color value
     */
    public func with(alpha: Float) -> CustomColor {
        return CustomColor(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: alpha)
    }
}

extension CustomColor {
    
    /**
     Initializes this color value with literal component values. e.g. (100, 50, 20, 1.0)
     
     - parameter red:   A value in the range 0...255
     - parameter green: A value in the range 0...255
     - parameter blue:  A value in the range 0...255
     - parameter alpha: A value in the range 0...1
     
     - returns: A new color value
     */
    public init(literalRed red: Int, green: Int, blue: Int, alpha: Float = 1) {
        self.init(red: Float(red)/255, green: Float(green)/255, blue: Float(blue)/255, alpha: alpha)
    }
    
    /**
     Returns the RGBA literal component values
     
     - returns: The RGBA literal component values
     */
    public func literalRGBA() -> RGBA {
        return RGBA(red: rgba.red * 255, green: rgba.green * 255, blue: rgba.blue * 255, alpha: rgba.alpha)
    }
    
}

extension CustomColor {
    
    /**
     Initializes this color value for the associated hex code (e.g. 0xfff, 0xfff0, 0xfff000, 0xfff000ff)
     
     - parameter hex:   The hex value representing this color
     - parameter alpha: An optional alpha value. Defaults to 1.0
     */
    public init?(hex: Int, alpha: Float? = nil) {
        self.init(hex: String(format:"%2X", hex), alpha: alpha)
    }
    
    /**
     Initializes this color value for the associated hex code (e.g. 'fff', 'fff0', 'fff00', 'fff000ff'). A '#' prefix is also supported
     
     - parameter hex:   The hex value representing this color
     - parameter alpha: An optional alpha value. Defaults to 1.0
     */
    public init?(hex: String, alpha: Float? = nil) {
        var hexValue = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        guard [3, 4, 6, 8].contains(hexValue.count) else { return nil }
        
        if hexValue.count == 3 {
            hexValue.append("F")
        }
        
        if hexValue.count == 6 {
            hexValue.append("FF")
        }
        
        if [3, 4].contains(hexValue.count) {
            for (index, char) in hexValue.enumerated() {
                let index = hexValue.index(hexValue.startIndex, offsetBy: index * 2)
                hexValue.insert(char, at: index)
            }
        }
        
        guard let normalizedHex = Int(hexValue, radix: 16) else { return nil }
        
        self.init(
            red:   Float((normalizedHex >> 24) & 0xFF) / 255,
            green: Float((normalizedHex >> 16) & 0xFF) / 255,
            blue:  Float((normalizedHex >> 8)  & 0xFF) / 255,
            alpha: alpha ?? Float((normalizedHex)  & 0xFF) / 255)
    }
    
    /**
     Returns a hex string representation of the color value
     
     - parameter withPrefix: If true, includes the '#' prefix
     
     - returns: A hex string representation
     */
    public func toHex(withAlpha: Bool = true) -> String {
        let alpha = withAlpha ? String(format: "%02X", Int(rgba.alpha * 255)) : ""
        return String(format: "%02X%02X%02X\(alpha)", Int(rgba.red * 255), Int(rgba.green * 255), Int(rgba.blue * 255))
    }
    
}

extension CustomColor: Equatable {
    public static func ==(lhs: CustomColor, rhs: CustomColor) -> Bool {
        return lhs.rgba == rhs.rgba
    }
}

extension CustomColor {
    
    /**
     Initializes this color value with the specified white value
     
     - parameter white: A value in the range 0...1
     - parameter alpha: A value in the range 0...1
     
     - returns: A new color value
     */
    public init(white: Float, alpha: Float = 1) {
        self.init(red: white, green: white, blue: white, alpha: alpha)
    }
    
    /**
     Initializes this color value with the specified CGColor
     
     - parameter cgColor: A CGColor instance to convert
     
     - returns: A new color value
     */
    public init?(cgColor: CGColor) {
        guard let components = cgColor.components else { return nil }
        let red, green, blue, alpha: Float
        
        if components.count == 2 {
            red = Float(components[0])
            green = Float(components[0])
            blue = Float(components[0])
            alpha = Float(components[1])
        } else {
            red = Float(components[0])
            green = Float(components[1])
            blue = Float(components[2])
            alpha = Float(components[3])
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Returns the CGColor representation of this color
    public var cgColor: CGColor {
        return CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
                       components: [CGFloat(rgba.red), CGFloat(rgba.green), CGFloat(rgba.blue), CGFloat(rgba.alpha)])!
    }
    
}

extension CustomColor {
    
    /// Returns true if the color is considered visually dark. False otherwise
    public var isDark: Bool {
        return (0.2126 * rgba.red + 0.7152 * rgba.green + 0.0722 * rgba.blue) < 0.5
    }
    
    /**
     Returns a new color value that is the inverse of this color
     
     - returns: A color that is the inverse of this color. e.g. white -> black
     */
    public func inverted() -> CustomColor {
        return CustomColor(red: 1 - rgba.red, green: 1 - rgba.green, blue: 1 - rgba.blue, alpha: rgba.alpha)
    }
    
}

extension CustomColor {
    
    public static var black: CustomColor { return CustomColor(white: 0) }
    public static var darkGray: CustomColor { return CustomColor(white: 0.333) }
    public static var lightGray: CustomColor { return CustomColor(white: 0.667) }
    public static var white: CustomColor { return CustomColor(white: 1) }
    public static var gray: CustomColor { return CustomColor(white: 0.5) }
    public static var red: CustomColor { return CustomColor(red: 1, green: 0, blue: 0) }
    public static var green: CustomColor { return CustomColor(red: 0, green: 1, blue: 0) }
    public static var blue: CustomColor { return CustomColor(red: 0, green: 0, blue: 1) }
    public static var cyan: CustomColor { return CustomColor(red: 0, green: 1, blue: 1) }
    public static var yellow: CustomColor { return CustomColor(red: 1, green: 1, blue: 0) }
    public static var magenta: CustomColor { return CustomColor(red: 1, green: 0, blue: 1) }
    public static var orange: CustomColor { return CustomColor(red: 1, green: 0.5, blue: 0) }
    public static var purple: CustomColor { return CustomColor(red: 0.5, green: 0, blue: 0.5) }
    public static var brown: CustomColor { return CustomColor(red: 0.6, green: 0.4, blue: 0.2) }
    public static var clear: CustomColor { return CustomColor(white: 0, alpha: 0) }
    
}

extension CustomColor: CustomStringConvertible {
    
    /// Returns a debug friendly description of this color. The string contains both a relative and literal representation as well as the associated hexValue
    public var description: String {
        let color = literalRGBA()
        return "(\(color.red), \(color.green), \(color.blue), \(rgba.alpha)) \(toHex(withAlpha: true))"
    }
    
}

extension CustomColor: ExpressibleByStringLiteral {
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hex: value)!
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(hex: value)!
    }
    
    public init(stringLiteral value: String) {
        self.init(hex: value)!
    }
    
}

extension CustomColor: Codable {
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let red = try container.decode(Float.self)
        let green = try container.decode(Float.self)
        let blue = try container.decode(Float.self)
        let alpha = try container.decode(Float.self)
        rgba = RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(rgba.red)
        try container.encode(rgba.green)
        try container.encode(rgba.blue)
        try container.encode(rgba.alpha)
    }
    
}

#if os(iOS)
    import UIKit
    extension CustomColor {
        public init?(systemColor: UIColor?) {
            guard let systemColor = systemColor else { return nil }
            self.init(cgColor: systemColor.cgColor)
        }
        
        public var systemColor: UIColor {
            return UIColor(cgColor: cgColor)
        }
    }
#endif

#if os(OSX)
    import AppKit
    extension Color {
        public init?(systemColor: NSColor?) {
            guard let systemColor = systemColor else { return nil }
            self.init(cgColor: color.cgColor)
        }
        
        public var systemColor: NSColor {
            return NSColor(cgColor: cgColor)!
        }
    }
#endif
