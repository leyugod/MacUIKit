//
//  MacElevation.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit阴影高度系统
/// 提供分层的阴影效果，增强界面的层次感和深度
public struct MacElevation {
    // MARK: - 阴影配置
    public struct Shadow {
        public let color: Color
        public let radius: CGFloat
        public let x: CGFloat
        public let y: CGFloat
        public let opacity: Double
        
        public init(
            color: Color = .black,
            radius: CGFloat,
            x: CGFloat = 0,
            y: CGFloat,
            opacity: Double = 0.1
        ) {
            self.color = color
            self.radius = radius
            self.x = x
            self.y = y
            self.opacity = opacity
        }
    }
    
    // MARK: - 阴影等级
    public let none: Shadow         // 无阴影
    public let level1: Shadow       // 1级阴影 - 轻微悬浮
    public let level2: Shadow       // 2级阴影 - 卡片
    public let level3: Shadow       // 3级阴影 - 浮动面板
    public let level4: Shadow       // 4级阴影 - 模态框
    public let level5: Shadow       // 5级阴影 - 下拉菜单
    public let level6: Shadow       // 6级阴影 - 最高层级
    
    // MARK: - 初始化器
    public init(
        none: Shadow = Shadow(radius: 0, y: 0, opacity: 0),
        level1: Shadow = Shadow(radius: 1, y: 1, opacity: 0.05),
        level2: Shadow = Shadow(radius: 2, y: 2, opacity: 0.08),
        level3: Shadow = Shadow(radius: 4, y: 4, opacity: 0.12),
        level4: Shadow = Shadow(radius: 8, y: 8, opacity: 0.15),
        level5: Shadow = Shadow(radius: 12, y: 12, opacity: 0.18),
        level6: Shadow = Shadow(radius: 16, y: 16, opacity: 0.2)
    ) {
        self.none = none
        self.level1 = level1
        self.level2 = level2
        self.level3 = level3
        self.level4 = level4
        self.level5 = level5
        self.level6 = level6
    }
}

// MARK: - 预定义阴影方案

public extension MacElevation {
    /// 默认阴影方案
    /// 适中的阴影效果，符合MacOS视觉风格
    static let `default` = MacElevation()
    
    /// 浅色主题阴影方案
    /// 较浅的阴影，适合浅色背景
    static let light = MacElevation(
        none: Shadow(radius: 0, y: 0, opacity: 0),
        level1: Shadow(radius: 1, y: 1, opacity: 0.04),
        level2: Shadow(radius: 2, y: 2, opacity: 0.06),
        level3: Shadow(radius: 4, y: 4, opacity: 0.08),
        level4: Shadow(radius: 8, y: 8, opacity: 0.1),
        level5: Shadow(radius: 12, y: 12, opacity: 0.12),
        level6: Shadow(radius: 16, y: 16, opacity: 0.15)
    )
    
    /// 深色主题阴影方案
    /// 更明显的阴影，适合深色背景
    static let dark = MacElevation(
        none: Shadow(radius: 0, y: 0, opacity: 0),
        level1: Shadow(radius: 1, y: 1, opacity: 0.15),
        level2: Shadow(radius: 2, y: 2, opacity: 0.2),
        level3: Shadow(radius: 4, y: 4, opacity: 0.25),
        level4: Shadow(radius: 8, y: 8, opacity: 0.3),
        level5: Shadow(radius: 12, y: 12, opacity: 0.35),
        level6: Shadow(radius: 16, y: 16, opacity: 0.4)
    )
}

// MARK: - 阴影工具方法

public extension MacElevation {
    /// 根据层级获取阴影
    /// - Parameter level: 层级 (0-6)
    /// - Returns: 对应的阴影配置
    func shadow(for level: Int) -> Shadow {
        switch level {
        case 0: return none
        case 1: return level1
        case 2: return level2
        case 3: return level3
        case 4: return level4
        case 5: return level5
        case 6: return level6
        default: return level6
        }
    }
    
    /// 创建自定义阴影
    /// - Parameters:
    ///   - radius: 阴影半径
    ///   - offset: 阴影偏移
    ///   - opacity: 阴影透明度
    /// - Returns: 自定义阴影配置
    func customShadow(
        radius: CGFloat,
        offset: CGSize = CGSize(width: 0, height: 0),
        opacity: Double = 0.1
    ) -> Shadow {
        return Shadow(
            radius: radius,
            x: offset.width,
            y: offset.height,
            opacity: opacity
        )
    }
}

// MARK: - View扩展

public extension View {
    /// 应用MacUIKit阴影
    /// - Parameter shadow: 阴影配置
    /// - Returns: 应用阴影后的视图
    func macShadow(_ shadow: MacElevation.Shadow) -> some View {
        self.shadow(
            color: shadow.color.opacity(shadow.opacity),
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
    
    /// 应用指定等级的阴影
    /// - Parameters:
    ///   - elevation: 阴影系统
    ///   - level: 阴影等级 (0-6)
    /// - Returns: 应用阴影后的视图
    func macElevation(_ elevation: MacElevation, level: Int) -> some View {
        macShadow(elevation.shadow(for: level))
    }
    
    /// 应用悬浮效果阴影
    /// - Parameter isHovered: 是否悬浮状态
    /// - Returns: 应用动态阴影的视图
    func macHoverShadow(_ isHovered: Bool) -> some View {
        let elevation = MacElevation.default
        let shadow = isHovered ? elevation.level3 : elevation.level1
        return macShadow(shadow)
            .animation(.easeInOut(duration: 0.2), value: isHovered)
    }
}

// MARK: - 语义化阴影扩展

public extension MacElevation {
    /// 按钮阴影
    var button: Shadow { level1 }
    
    /// 卡片阴影
    var card: Shadow { level2 }
    
    /// 面板阴影
    var panel: Shadow { level3 }
    
    /// 模态框阴影
    var modal: Shadow { level4 }
    
    /// 下拉菜单阴影
    var dropdown: Shadow { level5 }
    
    /// 工具提示阴影
    var tooltip: Shadow { level6 }
    
    /// 悬浮状态阴影
    var hover: Shadow { level3 }
    
    /// 按压状态阴影
    var pressed: Shadow { none }
} 