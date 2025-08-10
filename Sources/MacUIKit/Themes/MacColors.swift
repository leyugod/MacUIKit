//
//  MacColors.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit色彩系统
/// 提供完整的色彩规范，支持浅色和深色模式
public struct MacColors {
    // MARK: - 主色调
    public let primary: Color
    public let primaryVariant: Color
    
    // MARK: - 语义色彩
    public let success: Color
    public let warning: Color
    public let error: Color
    public let info: Color
    
    // MARK: - 背景色彩
    public let background: Color
    public let surface: Color
    public let onBackground: Color
    public let onSurface: Color
    
    // MARK: - 系统色彩
    public let separator: Color
    public let controlBackground: Color
    public let selectedContentBackground: Color
    public let secondaryBackground: Color
    public let tertiaryBackground: Color
    
    // MARK: - 文本色彩
    public let primaryText: Color
    public let secondaryText: Color
    public let tertiaryText: Color
    public let quaternaryText: Color
    
    // MARK: - 初始化器
    public init(
        primary: Color,
        primaryVariant: Color,
        success: Color,
        warning: Color,
        error: Color,
        info: Color,
        background: Color,
        surface: Color,
        onBackground: Color,
        onSurface: Color,
        separator: Color,
        controlBackground: Color,
        selectedContentBackground: Color,
        secondaryBackground: Color,
        tertiaryBackground: Color,
        primaryText: Color,
        secondaryText: Color,
        tertiaryText: Color,
        quaternaryText: Color
    ) {
        self.primary = primary
        self.primaryVariant = primaryVariant
        self.success = success
        self.warning = warning
        self.error = error
        self.info = info
        self.background = background
        self.surface = surface
        self.onBackground = onBackground
        self.onSurface = onSurface
        self.separator = separator
        self.controlBackground = controlBackground
        self.selectedContentBackground = selectedContentBackground
        self.secondaryBackground = secondaryBackground
        self.tertiaryBackground = tertiaryBackground
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self.tertiaryText = tertiaryText
        self.quaternaryText = quaternaryText
    }
}

// MARK: - 预定义色彩方案

public extension MacColors {
    /// 浅色主题色彩
    static let light = MacColors(
        // 主色调
        primary: Color(red: 0.0, green: 0.48, blue: 1.0),         // #007AFF
        primaryVariant: Color(red: 0.0, green: 0.4, blue: 0.85),  // #0066D9
        
        // 语义色彩
        success: Color(red: 0.2, green: 0.78, blue: 0.35),        // #34C759
        warning: Color(red: 1.0, green: 0.58, blue: 0.0),         // #FF9500
        error: Color(red: 1.0, green: 0.23, blue: 0.19),          // #FF3B30
        info: Color(red: 0.35, green: 0.68, blue: 0.95),          // #5AC8FA
        
        // 背景色彩
        background: Color(white: 0.98),                            // #FAFAFA
        surface: Color.white,                                      // #FFFFFF
        onBackground: Color.black,                                 // #000000
        onSurface: Color.black,                                    // #000000
        
        // 系统色彩
        separator: Color(white: 0.9),                              // #E5E5E5
        controlBackground: Color(white: 0.95),                     // #F2F2F2
        selectedContentBackground: Color(red: 0.0, green: 0.48, blue: 1.0, opacity: 0.1),
        secondaryBackground: Color(white: 0.96),                   // #F5F5F5
        tertiaryBackground: Color(white: 0.94),                    // #F0F0F0
        
        // 文本色彩
        primaryText: Color.black,                                  // #000000
        secondaryText: Color(white: 0.4),                          // #666666
        tertiaryText: Color(white: 0.6),                           // #999999
        quaternaryText: Color(white: 0.75)                         // #BFBFBF
    )
    
    /// 深色主题色彩
    static let dark = MacColors(
        // 主色调
        primary: Color(red: 0.1, green: 0.55, blue: 1.0),         // #1A8CFF
        primaryVariant: Color(red: 0.25, green: 0.65, blue: 1.0), // #40A6FF
        
        // 语义色彩
        success: Color(red: 0.3, green: 0.85, blue: 0.4),         // #4DD964
        warning: Color(red: 1.0, green: 0.65, blue: 0.1),         // #FFA61A
        error: Color(red: 1.0, green: 0.35, blue: 0.3),           // #FF594D
        info: Color(red: 0.45, green: 0.75, blue: 1.0),           // #73BFFF
        
        // 背景色彩
        background: Color(white: 0.1),                             // #1A1A1A
        surface: Color(white: 0.15),                               // #262626
        onBackground: Color.white,                                 // #FFFFFF
        onSurface: Color.white,                                    // #FFFFFF
        
        // 系统色彩
        separator: Color(white: 0.3),                              // #4D4D4D
        controlBackground: Color(white: 0.2),                      // #333333
        selectedContentBackground: Color(red: 0.1, green: 0.55, blue: 1.0, opacity: 0.2),
        secondaryBackground: Color(white: 0.18),                   // #2E2E2E
        tertiaryBackground: Color(white: 0.22),                    // #383838
        
        // 文本色彩
        primaryText: Color.white,                                  // #FFFFFF
        secondaryText: Color(white: 0.7),                          // #B3B3B3
        tertiaryText: Color(white: 0.5),                           // #808080
        quaternaryText: Color(white: 0.3)                          // #4D4D4D
    )
}

// MARK: - 色彩工具方法

public extension MacColors {
    /// 获取适合当前色彩方案的对比色
    func contrastColor(for backgroundColor: Color) -> Color {
        // 简化的对比度计算，实际项目中可以使用更精确的算法
        return backgroundColor == background ? onBackground : onSurface
    }
    
    /// 获取禁用状态的色彩
    func disabledColor(for color: Color) -> Color {
        return color.opacity(0.5)
    }
    
    /// 获取悬停状态的色彩
    func hoverColor(for color: Color) -> Color {
        return color.opacity(0.8)
    }
    
    /// 获取按压状态的色彩
    func pressedColor(for color: Color) -> Color {
        return color.opacity(0.6)
    }
} 