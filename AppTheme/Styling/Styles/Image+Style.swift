//
//  Image+Style.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 22/09/2019.
//

import Foundation
import UIKit

public typealias ImageStyle = (UIImageView) -> Void

//func image(named name: String) -> ImageStyle {
//    return { imageView in
//        imageView.image = UIImage(named: name, in: RewardKitManager.bundle, compatibleWith: nil)
//    }
//}

public func clipped(value: Bool? = true) -> ImageStyle {
    return { imageView in
        imageView.clipsToBounds = value ?? true
    }
}
