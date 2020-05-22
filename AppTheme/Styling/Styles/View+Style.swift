//
//  View+Style.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 18/06/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import UIKit

public typealias ViewStyle = (UIView) -> Void

public let shadowStyle: ViewStyle = { view in
    view.backgroundColor = .white
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.3
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 5
    view.layer.cornerRadius = 5
}

public func rounded(with radius: CGFloat? = 5) -> ViewStyle {
    return {
        $0.layer.cornerRadius = radius ?? 0
        $0.clipsToBounds = true
    }
}

public func primaryBackgroundColor() -> ViewStyle {
    return {
        $0.backgroundColor = .darkGray
    }
}

