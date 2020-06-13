//
//  Button+Style.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 13/06/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import UIKit
import Caprice

public typealias ButtonStyle = (UIButton) -> Void

public func roundedButton(with radius: CGFloat = 5) -> ButtonStyle {
    return {
        $0.layer.cornerRadius = radius
        $0.clipsToBounds = true
    }
}

public func filledButton(_ color: UIColor? = nil) -> ButtonStyle {
    return {
        $0.backgroundColor = color ?? UIColor.darkGray
    }
}

public func titleButton(_ text: String, color: UIColor? = nil, titleEdgeInsets: UIEdgeInsets? = nil) -> ButtonStyle {
    return {
        $0.setTitle(text, for: .normal)
        $0.setTitleColor(color, for: .normal)
        $0.titleEdgeInsets = titleEdgeInsets ?? UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
}

public let baseButton = roundedButton() <> filledButton()
