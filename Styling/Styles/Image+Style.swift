//
//  Image+Style.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 22/09/2019.
//

import Foundation
import UIKit

public typealias ImageStyle = (UIImageView) -> Void

public func clipped(value: Bool? = true) -> ImageStyle {
    return { imageView in
        imageView.clipsToBounds = value ?? true
    }
}
