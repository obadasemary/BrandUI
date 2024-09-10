//
//  RoundedStrokeModifier.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 04/10/2023.
//

import SwiftUI

/// A view modifier to add a rounded stroke (border) to a view.
private struct RoundedStrokeModifier: ViewModifier {
    
    // The corner radius of the rounded stroke.
    let cornerRadius: CGFloat
    // The color of the stroke (border).
    let borderColor: Color
    // The width of the stroke (border).
    let lineWidth: CGFloat
    
    /// Adds a rounded stroke (border) to the content view.
    /// - Parameter content: The content view to which the rounded stroke is applied.
    /// - Returns: A modified view with the rounded stroke.
     func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: lineWidth)
            )
    }
}

extension View {
    /// Applies a rounded stroke (border) to the view.
    /// - Parameters:
    ///   - cornerRadius: The corner radius of the rounded stroke. Default value is `CornerRadius.soft.rawValue`.
    ///   - borderColor: The color of the stroke (border). Default value is `.grey200`.
    ///   - lineWidth: The width of the stroke (border). Default value is `1`.
    /// - Returns: A modified view with the rounded stroke.
    public func roundedStroke(
        cornerRadius: CGFloat = CornerRadius.soft.rawValue,
        borderColor: Color = .orange,
        lineWidth: CGFloat = 1.25
    ) -> some View {
        self
            .modifier(
                RoundedStrokeModifier(
                    cornerRadius: cornerRadius,
                    borderColor: borderColor,
                    lineWidth: lineWidth
                )
            )
    }
}

