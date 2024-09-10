//
//  ShimmerEffect.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 24/09/2023.
//

import SwiftUI

// MARK: - Shimmer Configuration

/// An object that contains all options for shimmer animation appearance
public struct ShimmerConfiguration {
    let tint: Color
    let highlight: Color
    let blur: CGFloat
    let highlightOpacity: CGFloat
    let speed: CGFloat
    let degrees: Double
    let blendMode: BlendMode
    let isLoaded: Bool
    
    /// Shimmer Configurations
    ///
    /// - Parameters:
    ///   - tint: view tint color. **Default value** :`.gray.opacity(0.3)`
    ///   - highlight: view highlight color. **Default value** : `.gray`
    ///   - blur: the blurring radius. **Default value** : `5`
    ///   - highlightOpacity: the highlight opacity so you can control the opacity in general you can pass from 0 to 1. **Default value** : `1`
    ///   - speed: general speed I prefer to use 5, but you can try 1. **Default value** : `5`
    ///   - degrees: the degree of the shimmer we can use 0 degrees if we wanna have a horizontal effect, or we can play and make it 45 if we wanna have a diagonal effect. **Default value**: `45`
    ///   - blendMode: Sets the blend mode for compositing this view with overlapping views. **Default value**: `.screen`
    ///   - isLoaded: Control to show the shimmer or hide it. **Default value** : `false`
    ///
    public init(
        tint: Color = .gray.opacity(0.3),
        highlight: Color = .gray,
        blur: CGFloat = 5,
        highlightOpacity: CGFloat = 1,
        speed: CGFloat = 5,
        degrees: Double = 45,
        blendMode: BlendMode = .screen,
        isLoaded: Bool = false
    ) {
        self.tint = tint
        self.highlight = highlight
        self.blur = blur
        self.highlightOpacity = highlightOpacity
        self.speed = speed
        self.degrees = degrees
        self.blendMode = blendMode
        self.isLoaded = isLoaded
    }
}

// MARK: - Shimmer Effect ViewModifier

/// Modifier that adds `Shimmer` effect to view.
/// [Figma link]()
struct ShimmerEffectViewModifier: ViewModifier {
    /// Shimmer Configuration. See more in `ShimmerConfiguration` documentation
    public var configuration: ShimmerConfiguration
    /// Animation Properties
    @State private var moveTo: CGFloat = -0.7
    
    public func body(content: Content) -> some View {
        if configuration.isLoaded {
            content
        } else {
            content
            // Adding shimmer animation with the help of Masking Modifier.
            // Hiding the normal one and adding shimmer one instead
                .hidden()
                .overlay(
                    // Changing tint Color
                    Rectangle()
                        .fill(configuration.tint)
                        .mask(
                            content
                                .redacted(reason: .placeholder)
                        )
                        .overlay(
                            maskedView()
                            // Mask with the content
                            .mask(
                                content
                                    .redacted(reason: .placeholder)
                            )
                        )
                        // Animating movement
                        .onAppear {
                            // Sometimes a forever animation called inside `onAppear` will cause animation glitches, especially when using inside `NavigationView`,
                            // to avoid that, simply wrap it inside the `DispatchQueue`
                            DispatchQueue.main.async {
                                moveTo = 0.7
                            }
                        }
                        .animation(
                            .linear(duration: configuration.speed)
                            .repeatForever(autoreverses: false),
                            value: moveTo
                        )
                )
        }
    }
    
    private func maskedView() -> some View {
        GeometryReader {
            let size = $0.size
            let extraOffset = size.height / 2.5
            
            Rectangle()
                .fill(configuration.highlight)
                .mask(
                    Rectangle()
                        // Gradient for glowing at the center
                        .fill(
                            .linearGradient(
                                colors: [
                                    .white.opacity(0),
                                    configuration
                                        .highlight
                                        .opacity(
                                            configuration
                                                .highlightOpacity
                                        ),
                                    .white.opacity(0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    // Adding blur
                        .blur(radius: configuration.blur)
                        .blendMode(.screen)
                    // Rotating (Degree: Your Choice of Wish)
                        .rotationEffect(.init(degrees: configuration.degrees))
                    // Moving to the Start
                        .offset(
                            x: moveTo > 0 ? extraOffset: -extraOffset
                        )
                        .offset(x: size.width * moveTo)
                )
            // Adding  BlendMode
                .blendMode(configuration.blendMode)
        }
    }
}

// MARK: - Shimmer Effect Custom ViewModifier

public extension View {
    /// Add shimmer effect to view.
    ///
    /// **Note** : We are using `.shimmer(_:)` with the default values, and you need to use it with the `isLoaded` parameter to control
    /// stopping and showing the shimmer.
    ///
    /// **How to use `Shimmer`** :
    ///
    /// ```
    /// HStack {
    ///   RoundedRectangle(cornerRadius: 10)
    ///     .frame(width: 200, height: 100)
    ///     .shimmer(.init(isLoaded: isLoaded))
    ///         
    ///     RoundedRectangle(cornerRadius: 10)
    ///      .frame(width: 200, height: 100)
    ///      .shimmer(
    ///        .init(
    ///          tint: .grey900.opacity(0.3),
    ///          highlight: .grey100,
    ///          blur: 5,
    ///          highlightOpacity: 1,
    ///          speed: 5,
    ///          degrees: 45,
    ///          blendMode: .screen,
    ///          isLoaded: false
    ///        )
    ///      )
    ///  }
    /// ```
    /// - Parameters:
    ///   - tint: view tint color, Default value is `.grey900.opacity(0.3)`.
    ///   - highlight: view highlight color, Default value is `.grey100`.
    ///   - blur: the blurring radius, Default value is `5`.
    ///   - highlightOpacity: the highlight opacity so you can control the opacity in general you can pass from 0 to 1, Default value is `1`.
    ///   - speed: general speed I prefer to use 5, but you can try 1, Default value is `5`.
    ///   - degrees: the degree of the shimmer we can use 0 degrees if we wanna have a horizontal effect, or we can play and make it 45 if we wanna have a diagonal effect, Default value is `45`.
    ///   - blendMode: Sets the blend mode for compositing this view with overlapping views, Default value is `.screen`.
    ///   - isLoaded: Control to show the shimmer or hide it, Default value is `false`.
    /// - Returns: view object with shimmer effect
    @ViewBuilder
    func shimmer(_ configuration: ShimmerConfiguration) -> some View {
        modifier(ShimmerEffectViewModifier(configuration: configuration))
    }
}
