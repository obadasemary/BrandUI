//
//  LoadingPlaceholderView.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 21/08/2024.
//

import SwiftUI

public struct BrandUILoadingPlaceholderView: View {
    
    let cornerRadius: CornerRadius
    let configuration: ShimmerConfiguration
    
    public init(
        cornerRadius: CornerRadius = .edgy,
        configuration: ShimmerConfiguration = .lightConfiguration
    ) {
        self.cornerRadius = cornerRadius
        self.configuration = configuration
    }
    
    public var body: some View {
        VStack(spacing: BrandUIConstants.spacing32) {
            VStack(alignment: .center, spacing: BrandUIConstants.spacing16) {
                RoundedRectangle(
                    cornerRadius: cornerRadius.rawValue
                )
                .frame(
                    width: BrandUIConstants.spacing56,
                    height: BrandUIConstants.spacing56
                )
                
                VStack(alignment: .center, spacing: BrandUIConstants.spacing8) {
                    RoundedRectangle(
                        cornerRadius: cornerRadius.rawValue
                    )
                    .frame(
                        width: UIConstants.spacing200,
                        height: BrandUIConstants.spacing24
                    )
                    
                    RoundedRectangle(
                        cornerRadius: cornerRadius.rawValue
                    )
                    .frame(
                        width: BrandUIConstants.spacing80,
                        height: BrandUIConstants.spacing24
                    )
                }
            }
            
            ForEach(1..<3) { _ in
                RoundedRectangle(
                    cornerRadius: cornerRadius.rawValue
                )
                .frame(maxWidth: .infinity)
                .frame(height: UIConstants.spacing74)
            }
            
            ForEach(1..<5) { _ in
                HStack(spacing: BrandUIConstants.spacing8) {
                    RoundedRectangle(
                        cornerRadius: cornerRadius.rawValue
                    )
                    .frame(
                        width: BrandUIConstants.spacing48,
                        height: BrandUIConstants.spacing48
                    )
                    
                    VStack(alignment: .leading, spacing: BrandUIConstants.spacing8) {
                        RoundedRectangle(
                            cornerRadius: cornerRadius.rawValue
                        )
                        .frame(
                            width: UIConstants.spacing133,
                            height: BrandUIConstants.spacing16
                        )
                        
                        RoundedRectangle(
                            cornerRadius: cornerRadius.rawValue
                        )
                        .frame(
                            width: BrandUIConstants.spacing48,
                            height: BrandUIConstants.spacing16
                        )
                    }
                    
                    Spacer()
                    
                    RoundedRectangle(
                        cornerRadius: cornerRadius.rawValue
                    )
                    .frame(
                        width: BrandUIConstants.spacing48,
                        height: BrandUIConstants.spacing24
                    )
                }
            }
            
            Spacer()
        }
        .shimmer(configuration)
    }
}

extension BrandUILoadingPlaceholderView {
    enum UIConstants {
        static let spacing74: CGFloat = 74
        static let spacing133: CGFloat = 133
        static let spacing200: CGFloat = 200
    }
}
