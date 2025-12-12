//
//  PlatformDetector.swift
//  swift-x-dev
//
//  Created for platform-specific layout detection
//

import SwiftUI

#if os(iOS)
import UIKit
#endif

/// 平台类型枚举
enum PlatformType {
    case iPhone      // iOS iPhone
    case iPad        // iOS iPad
    case macOS       // macOS
    
    /// 当前平台类型
    static var current: PlatformType {
        #if os(macOS)
        return .macOS
        #elseif os(iOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .iPad
        } else {
            return .iPhone
        }
        #else
        return .iPhone // 默认
        #endif
    }
    
    /// 是否为 iPhone
    var isiPhone: Bool {
        self == .iPhone
    }
    
    /// 是否为 iPad 或 macOS（需要相同布局的平台）
    var isDesktopLike: Bool {
        self == .iPad || self == .macOS
    }
}

/// 平台检测器
struct PlatformDetector {
    static var current: PlatformType {
        PlatformType.current
    }
    
    static var isiPhone: Bool {
        current.isiPhone
    }
    
    static var isiPad: Bool {
        current == .iPad
    }
    
    static var ismacOS: Bool {
        current == .macOS
    }
    
    /// iPadOS 或 macOS（需要相同布局）
    static var isDesktopLike: Bool {
        current.isDesktopLike
    }
}

