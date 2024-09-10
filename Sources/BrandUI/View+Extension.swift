//
//  View+Extension.swift
//  BrandUI
//
//  Created by Abdelrahman Mohamed on 04/12/2023.
//

import SwiftUI

// https://medium.com/@Lakshmnaidu/hide-view-in-swiftui-494309bf011
public extension View {
    func hide(
        if isHiddden: Bool
    ) -> some View {
        ModifiedContent(
            content: self,
            modifier: HideViewModifier(
                isHidden: isHiddden
            )
        )
    }
}

struct HideViewModifier: ViewModifier {
    let isHidden: Bool
    @ViewBuilder func body(
        content: Content
    ) -> some View {
        if isHidden {
            EmptyView()
                .frame(
                    width: .zero,
                    height: .zero
                )
        } else {
            content
        }
    }
}
