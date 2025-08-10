//
//  MacCornerRadius.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit圆角系统
/// 提供统一的圆角规范，确保界面元素的视觉一致性
public struct MacCornerRadius {
    // MARK: - 基础圆角
    public let none: CGFloat    // 0px - 无圆角
    public let xs: CGFloat      // 2px - 最小圆角
    public let sm: CGFloat      // 4px - 小圆角
    public let md: CGFloat      // 8px - 中等圆角
    public let lg: CGFloat      // 12px - 大圆角
    public let xl: CGFloat      // 16px - 超大圆角
    public let xxl: CGFloat     // 20px - 更大圆角
    public let full: CGFloat    // 9999px - 完全圆角
    
    // MARK: - 语义化圆角
    public let button: CGFloat          // 按钮圆角
    public let input: CGFloat           // 输入框圆角
    public let card: CGFloat            // 卡片圆角
    public let modal: CGFloat           // 模态框圆角
    public let tooltip: CGFloat         // 工具提示圆角
    public let badge: CGFloat           // 徽章圆角
    public let avatar: CGFloat          // 头像圆角
    
    // MARK: - 初始化器
    public init(
        none: CGFloat = 0,
        xs: CGFloat = 2,
        sm: CGFloat = 4,
        md: CGFloat = 8,
        lg: CGFloat = 12,
        xl: CGFloat = 16,
        xxl: CGFloat = 20,
        full: CGFloat = 9999,
        button: CGFloat = 6,
        input: CGFloat = 6,
        card: CGFloat = 8,
        modal: CGFloat = 12,
        tooltip: CGFloat = 4,
        badge: CGFloat = 12,
        avatar: CGFloat = 8
    ) {
        self.none = none
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.xxl = xxl
        self.full = full
        self.button = button
        self.input = input
        self.card = card
        self.modal = modal
        self.tooltip = tooltip
        self.badge = badge
        self.avatar = avatar
    }
}

// MARK: - 预定义圆角方案

public extension MacCornerRadius {
    /// 默认圆角方案
    /// 适中的圆角设计，符合MacOS视觉风格
    static let `default` = MacCornerRadius()
    
    /// 尖锐圆角方案
    /// 更加现代和锐利的设计风格
    static let sharp = MacCornerRadius(
        none: 0,
        xs: 1,
        sm: 2,
        md: 4,
        lg: 6,
        xl: 8,
        xxl: 10,
        full: 9999,
        button: 3,
        input: 3,
        card: 4,
        modal: 6,
        tooltip: 2,
        badge: 6,
        avatar: 4
    )
    
    /// 圆润圆角方案
    /// 更加柔和和友好的设计风格
    static let rounded = MacCornerRadius(
        none: 0,
        xs: 4,
        sm: 8,
        md: 12,
        lg: 16,
        xl: 20,
        xxl: 24,
        full: 9999,
        button: 12,
        input: 10,
        card: 16,
        modal: 20,
        tooltip: 8,
        badge: 16,
        avatar: 12
    )
}

// MARK: - 圆角工具方法

public extension MacCornerRadius {
    /// 根据尺寸获取合适的圆角
    /// - Parameter size: 元素尺寸
    /// - Returns: 建议的圆角值
    func adaptiveRadius(for size: CGSize) -> CGFloat {
        let minDimension = min(size.width, size.height)
        switch minDimension {
        case 0..<24: return xs
        case 24..<48: return sm
        case 48..<72: return md
        case 72..<96: return lg
        case 96..<120: return xl
        default: return xxl
        }
    }
    
    /// 获取指定倍数的基础圆角
    /// - Parameter multiplier: 倍数
    /// - Returns: 计算后的圆角值
    func radius(_ multiplier: CGFloat) -> CGFloat {
        return sm * multiplier
    }
}

// MARK: - View扩展

public extension View {
    /// 应用MacUIKit圆角样式
    /// - Parameter radius: 圆角值
    /// - Returns: 应用圆角后的视图
    func macCornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius))
    }
    
    /// 应用指定圆角到特定角
    /// - Parameters:
    ///   - radius: 圆角值
    ///   - corners: 要应用圆角的角 (.topLeading, .topTrailing, .bottomLeading, .bottomTrailing)
    /// - Returns: 应用圆角后的视图
    func macCornerRadius(_ radius: CGFloat, corners: RectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - 圆角枚举

/// 指定圆角的角
public struct RectCorner: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let topLeading = RectCorner(rawValue: 1 << 0)
    public static let topTrailing = RectCorner(rawValue: 1 << 1)
    public static let bottomLeading = RectCorner(rawValue: 1 << 2)
    public static let bottomTrailing = RectCorner(rawValue: 1 << 3)
    
    public static let allCorners: RectCorner = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
    public static let topCorners: RectCorner = [.topLeading, .topTrailing]
    public static let bottomCorners: RectCorner = [.bottomLeading, .bottomTrailing]
    public static let leadingCorners: RectCorner = [.topLeading, .bottomLeading]
    public static let trailingCorners: RectCorner = [.topTrailing, .bottomTrailing]
}

// MARK: - 自定义Shape

/// 指定角的圆角Shape
private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: RectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeft = corners.contains(.topLeading) ? radius : 0
        let topRight = corners.contains(.topTrailing) ? radius : 0
        let bottomLeft = corners.contains(.bottomLeading) ? radius : 0
        let bottomRight = corners.contains(.bottomTrailing) ? radius : 0
        
        let width = rect.size.width
        let height = rect.size.height
        
        // 开始绘制路径
        path.move(to: CGPoint(x: topLeft, y: 0))
        
        // 顶边
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        if topRight > 0 {
            path.addArc(center: CGPoint(x: width - topRight, y: topRight),
                       radius: topRight, startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
        }
        
        // 右边
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        if bottomRight > 0 {
            path.addArc(center: CGPoint(x: width - bottomRight, y: height - bottomRight),
                       radius: bottomRight, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        }
        
        // 底边
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        if bottomLeft > 0 {
            path.addArc(center: CGPoint(x: bottomLeft, y: height - bottomLeft),
                       radius: bottomLeft, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        }
        
        // 左边
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        if topLeft > 0 {
            path.addArc(center: CGPoint(x: topLeft, y: topLeft),
                       radius: topLeft, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        }
        
        path.closeSubpath()
        return path
    }
} 