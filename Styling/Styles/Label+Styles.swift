//
//  Label+Styles.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 12/06/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation
import UIKit
import Caprice

public typealias LabelStyle = (UILabel) -> Void

public let lightLabelStyle: LabelStyle = { label in
    label.textColor = UIColor.lightGray
}

public let greenLabel: LabelStyle = { label in
    label.textColor = UIColor.mainGreen
}

public let darkGreyLabel: LabelStyle = { label in
    label.textColor = UIColor.darkGray
}

public let regularGreyLabel: LabelStyle = { label in
    label.textColor = UIColor.mediumGrey2
}

public let discalimerGreyLabel: LabelStyle = { label in
    label.textColor = UIColor.mediumGrey4
}

public func fontSyle(of font: UIFont) -> LabelStyle {
    return { label in
        label.font = font
    }
}

public func textColor(color c: UIColor) -> LabelStyle {
    return { label in
        label.textColor = c
    }
}

public func mediumLabel(of size: CGFloat? = nil) -> LabelStyle {
    return { label in
        label.font = UIFont.systemFont(ofSize: size ?? 19, weight: .medium)
    }
}

public func regularLabel(of size: CGFloat? = nil) -> LabelStyle {
    return { label in
        label.font = UIFont.systemFont(ofSize: size ?? 22, weight: .regular)
    }
}

public func lightLabel(of size: CGFloat? = nil) -> LabelStyle {
    return { label in
        label.font = UIFont.systemFont(ofSize: size ?? 17, weight: .light)
    }
}

public func thinLabel(of size: CGFloat? = nil) -> LabelStyle {
    return { label in
        label.font = UIFont.systemFont(ofSize: size ?? 17, weight: .thin)
    }
}

public func textLabel(_ text: String) -> LabelStyle {
    return { label in
        label.text = text
    }
}

public let mediumGreen = greenLabel <> mediumLabel()

public let mediumGrey = darkGreyLabel <> mediumLabel()

public let disclaimerTextStyle = discalimerGreyLabel <> thinLabel(of: 17)

public let thinLabelStyle = thinLabel(of: 12) <> textColor(color: .white)

public func attributedText(_ attributes: [NSAttributedString.Key: Any]) -> (String) -> NSMutableAttributedString {
    return { s in
        return NSMutableAttributedString(string: s, attributes: attributes)
    }
}

public let greyBoldAttributes: [NSAttributedString.Key: Any] = [
    NSAttributedString.Key.foregroundColor: UIColor.mediumGrey,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
]

public let greenBoldAttributes = [
    NSAttributedString.Key.foregroundColor: UIColor.mainGreen,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
]

public let greenLittleBoldAttributes = [
    NSAttributedString.Key.foregroundColor: UIColor.mainGreen,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
]
