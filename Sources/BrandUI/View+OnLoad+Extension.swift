//
//  View+OnLoad+Extension.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 25/02/2024.
//

import SwiftUI

public struct ViewDidLoadModifier: ViewModifier {
    
    @State private var hasLoaded = false
    let action: () -> Void
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                if !hasLoaded {
                    hasLoaded = true
                    action()
                }
            }
    }
}

public extension View {
    func onLoad(perform action: @escaping () -> Void) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
