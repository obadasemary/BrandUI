//
//  ShimmerConfiguration+Home.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 03/01/2024.
//

public extension ShimmerConfiguration {
    /// Shimmer configuration for `Home` feature
    ///
    /// - tint : `.grey50`
    /// - highlight: `.white
    /// - degrees : `90`
    ///
    /// [Figma link](https://www.figma.com/file/9n0SJdZ3OmQ0zra2J4irYb/All-in-All?type=design&node-id=9096-33200&mode=dev)
    static var lightConfiguration: ShimmerConfiguration {
        .init(
            tint: .gray,
            highlight: .white,
            degrees: 90
        )
    }
    
    /// Shimmer configuration for `Activty History` feature
    ///
    /// - tint : `.grey100`
    /// - highlight: `.white
    /// - degrees : `90`
    ///
    /// [Figma link](https://www.figma.com/file/9n0SJdZ3OmQ0zra2J4irYb/All-in-All?type=design&node-id=13084-34252&mode=design&t=5bBnjtgJknnVGpK8-4)
    static var darkConfiguration: ShimmerConfiguration {
        .init(
            tint: .gray,
            highlight: .white,
            degrees: 90
        )
    }
}
