//
//  UIView+CornerRadius.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 20/06/2023.
//  Copyright © 2023 BrandUI. All rights reserved.
//

import UIKit

/// Predefined list of available radiuses based on [design system]()
public enum CornerRadius: CGFloat {
    /// Radius value = 4
    case edgy = 4
    /// Radius value = 8
    case soft = 8
    /// Radius value = 12
    case extraSoft = 12
    /// Radius value = 16
    case xl = 16
    /// Radius value = 24
    case radius_24 = 24
    /// Radius value = 32
    case _2xl = 32
    /// Radius value = `100`
    case rounded = 100
}

public extension UIView {
    /// Make rounded corners on view. By default, use `cornerCurve` value as `.continuous`
    /// - Parameters:
    ///   - corners: corners that should be rounded. **Default value** : `all corners`
    ///   - radius: see `CornerRadius` enumeration
    func roundCorners(
        _ corners: CACornerMask = [
            .layerMaxXMaxYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner
        ],
        radius: CornerRadius
    ) {
        clipsToBounds = true
        layer.maskedCorners = corners
        layer.cornerRadius = radius.rawValue
        layer.cornerCurve = .continuous
    }
}
