//
//  PlatformLayoutView.swift
//  swift-x-dev
//
//  Created by Simon Mau on 2025/12/8.
//


import SwiftUI

/// 平台布局视图构建器
/// iOS 独立，iPadOS 和 macOS 使用相同布局
struct PlatformLayoutView<iOSContent: View, DesktopContent: View>: View {
    let iOS: () -> iOSContent
    let desktop: () -> DesktopContent
    
    var body: some View {
        Group {
            switch PlatformDetector.current {
            case .iPhone:
                iOS()
            case .iPad, .macOS:
                desktop()
            }
        }
    }
}

/// 平台布局修饰符
extension View {
    /// 应用平台特定的布局修饰符
    /// iOS 独立，iPadOS 和 macOS 使用相同布局
    public func platformLayout(
        iOS: @escaping (Self) -> some View,
        desktop: @escaping (Self) -> some View
    ) -> some View {
        Group {
            switch PlatformDetector.current {
            case .iPhone:
                iOS(self)
            case .iPad, .macOS:
                desktop(self)
            }
        }
    }
    
    /// 仅在 iPhone 上应用修饰符
    public func iPhoneOnly<Content: View>(@ViewBuilder _ modifier: (Self) -> Content) -> some View {
        if PlatformDetector.isiPhone {
            return AnyView(modifier(self))
        } else {
            return AnyView(self)
        }
    }
    
    /// 仅在 iPad 或 macOS 上应用修饰符
    public func desktopLike<Content: View>(@ViewBuilder _ modifier: (Self) -> Content) -> some View {
        if PlatformDetector.isDesktopLike {
            return AnyView(modifier(self))
        } else {
            return AnyView(self)
        }
    }
}
