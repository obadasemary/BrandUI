//
//  View+Corners.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 28/11/2023.
//

import SwiftUI

public extension View {
    /// Make round provided corners with specific radius
    /// - Parameters:
    ///   - radius: radius that will be applied to corner
    ///   - corners: `UIRectCorner` that should be rounded
    /// - Returns: view with rounded corners
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners) )
    }
}

struct RoundedCornerShape: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    init(radius: CGFloat, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
