//
//  Color+Styles.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 12/06/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation
import UIKit

public struct AppTheme {
    public var primaryColor: UIColor
    public var primaryTextColor: UIColor
    public var primaryColorVariant: UIColor
    
    public init(
        primaryColor: UIColor,
        primaryTextColor: UIColor,
        primaryColorVariant: UIColor) {
        self.primaryColor = primaryColor
        self.primaryTextColor = primaryTextColor
        self.primaryColorVariant = primaryColorVariant
    }
}

extension UIColor {
    public static var primaryTint: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                guard UITraitCollection.userInterfaceStyle == .dark else {
                    return UIColor.yellow
                }
                
                return UIColor.red
            }
        } else {
            /// Return a fallback color for iOS 12 and lower.
            return UIColor.red
        }
    }()
}

extension UIColor {
    public static var mainDark: UIColor {
        if #available(iOS 13.0, *) {
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else {
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
    }

    public static var mainMedium: UIColor {
        return #colorLiteral(red: 0.3607843137 / 255, green: 0.6549019608 / 255, blue: 0.2509803922 / 255, alpha: 1)
    }
    
    public static var mainLight: UIColor {
         return #colorLiteral(red: 0.537254902 / 255, green: 0.737254902 / 255, blue: 0.4470588235 / 255, alpha: 1)
//        if #available(iOS 13.0, *) {
//            return #colorLiteral(red: 0.537254902 / 255, green: 0.737254902 / 255, blue: 0.4470588235 / 255, alpha: 1)
//        } else {
//            return .red
//        }
    }
    
    public static var mainExtraLight: UIColor {
        return #colorLiteral(red: 0.768627451 / 255, green: 0.8588235294 / 255, blue: 0.737254902 / 255, alpha: 1)
    }
}

extension UIColor {
    public static var mainGreen: UIColor {
        /// #258900
        return UIColor(red: 37/255, green: 137/255, blue: 0/255, alpha: 1)
    }
    
    public static var darkGray: UIColor {
        return UIColor(red: 49/255, green: 49/255, blue: 49/255, alpha: 1)
    }
    
    public static var lightBackground: UIColor {
        /// #F8F8F8
        let i: CGFloat = 248
        return UIColor(red: i/255, green: i/255, blue: i/255, alpha: 1)
    }
    
    public static var mediumGrey4: UIColor {
        /// #444444
        return UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
    }
    
    public static var mediumGrey3: UIColor {
        /// #4B506A
        return UIColor(red: 75/255, green: 80/255, blue: 106/255, alpha: 1)
    }
    
    public static var mediumGrey2: UIColor {
        /// #404040
        return UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
    }
    
    public static var mediumGrey: UIColor {
        /// #323232
        .red
        //return UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    }
}
