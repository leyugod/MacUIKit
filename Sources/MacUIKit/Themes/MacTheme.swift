//
//  MacTheme.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

// MARK: - 主题协议

/// MacUIKit主题协议
/// 定义了完整的设计系统，包括色彩、字体、间距等设计令牌
public protocol MacThemeProtocol {
    var colors: MacColors { get }
    var typography: MacTypography { get }
    var spacing: MacSpacing { get }
    var cornerRadius: MacCornerRadius { get }
    var elevation: MacElevation { get }
    var animation: MacAnimation { get }
}

// MARK: - 主题实现

/// MacUIKit默认主题
public struct MacTheme: MacThemeProtocol {
    public let colors: MacColors
    public let typography: MacTypography
    public let spacing: MacSpacing
    public let cornerRadius: MacCornerRadius
    public let elevation: MacElevation
    public let animation: MacAnimation
    
    public init(
        colors: MacColors = .light,
        typography: MacTypography = .default,
        spacing: MacSpacing = .default,
        cornerRadius: MacCornerRadius = .default,
        elevation: MacElevation = .default,
        animation: MacAnimation = .default
    ) {
        self.colors = colors
        self.typography = typography
        self.spacing = spacing
        self.cornerRadius = cornerRadius
        self.elevation = elevation
        self.animation = animation
    }
}

// MARK: - 预定义主题

public extension MacTheme {
    /// 浅色主题
    static let light = MacTheme(
        colors: .light,
        typography: .default,
        spacing: .default,
        cornerRadius: .default,
        elevation: .default,
        animation: .default
    )
    
    /// 深色主题
    static let dark = MacTheme(
        colors: .dark,
        typography: .default,
        spacing: .default,
        cornerRadius: .default,
        elevation: .default,
        animation: .default
    )
    
    /// 默认主题（跟随系统）
    static let `default` = MacTheme.light
}

// MARK: - 环境值支持

private struct MacThemeKey: EnvironmentKey {
    static let defaultValue: MacTheme = .default
}

public extension EnvironmentValues {
    var macTheme: MacTheme {
        get { self[MacThemeKey.self] }
        set { self[MacThemeKey.self] = newValue }
    }
}

// MARK: - View扩展

public extension View {
    /// 应用MacUIKit主题
    /// - Parameter theme: 要应用的主题
    /// - Returns: 应用主题后的视图
    func macTheme(_ theme: MacTheme) -> some View {
        environment(\.macTheme, theme)
    }
} 