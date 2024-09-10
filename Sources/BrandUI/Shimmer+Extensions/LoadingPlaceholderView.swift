//
//  LoadingPlaceholderView.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 03/01/2024.
//

import SwiftUI

public struct LoadingPlaceholderView: View {
    
    let cornerRadius: CornerRadius
    let configuration: ShimmerConfiguration
    
    public init(
        cornerRadius: CornerRadius = .extraSoft,
        configuration: ShimmerConfiguration = .lightConfiguration
    ) {
        self.cornerRadius = cornerRadius
        self.configuration = configuration
    }
    
    public var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius.rawValue
        )
        .shimmer(configuration)
    }
}
