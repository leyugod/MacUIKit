//
//  MacSpacing.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit间距系统
/// 基于4px网格的间距规范，确保界面的一致性和节奏感
public struct MacSpacing {
    // MARK: - 基础间距
    public let xs: CGFloat      // 4px - 最小间距
    public let sm: CGFloat      // 8px - 小间距
    public let md: CGFloat      // 12px - 中等间距
    public let lg: CGFloat      // 16px - 大间距
    public let xl: CGFloat      // 20px - 超大间距
    public let xxl: CGFloat     // 24px - 更大间距
    public let xxxl: CGFloat    // 32px - 最大间距
    
    // MARK: - 语义化间距
    public let componentPadding: EdgeInsets     // 组件内边距
    public let cardPadding: EdgeInsets          // 卡片内边距
    public let buttonPadding: EdgeInsets        // 按钮内边距
    public let inputPadding: EdgeInsets         // 输入框内边距
    public let modalPadding: EdgeInsets         // 模态框内边距
    
    // MARK: - 特殊间距
    public let sectionSpacing: CGFloat          // 章节间距
    public let groupSpacing: CGFloat            // 组间距
    public let itemSpacing: CGFloat             // 项目间距
    public let lineSpacing: CGFloat             // 行间距
    
    // MARK: - 初始化器
    public init(
        xs: CGFloat = 4,
        sm: CGFloat = 8,
        md: CGFloat = 12,
        lg: CGFloat = 16,
        xl: CGFloat = 20,
        xxl: CGFloat = 24,
        xxxl: CGFloat = 32,
        componentPadding: EdgeInsets = EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16),
        cardPadding: EdgeInsets = EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16),
        buttonPadding: EdgeInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16),
        inputPadding: EdgeInsets = EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12),
        modalPadding: EdgeInsets = EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24),
        sectionSpacing: CGFloat = 32,
        groupSpacing: CGFloat = 16,
        itemSpacing: CGFloat = 8,
        lineSpacing: CGFloat = 4
    ) {
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.xxl = xxl
        self.xxxl = xxxl
        self.componentPadding = componentPadding
        self.cardPadding = cardPadding
        self.buttonPadding = buttonPadding
        self.inputPadding = inputPadding
        self.modalPadding = modalPadding
        self.sectionSpacing = sectionSpacing
        self.groupSpacing = groupSpacing
        self.itemSpacing = itemSpacing
        self.lineSpacing = lineSpacing
    }
}

// MARK: - 预定义间距方案

public extension MacSpacing {
    /// 默认间距方案
    /// 基于4px网格的标准间距
    static let `default` = MacSpacing()
    
    /// 紧凑间距方案
    /// 适用于信息密度较高的界面
    static let compact = MacSpacing(
        xs: 2,
        sm: 4,
        md: 8,
        lg: 12,
        xl: 16,
        xxl: 20,
        xxxl: 24,
        componentPadding: EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12),
        cardPadding: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12),
        buttonPadding: EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12),
        inputPadding: EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10),
        modalPadding: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20),
        sectionSpacing: 24,
        groupSpacing: 12,
        itemSpacing: 6,
        lineSpacing: 2
    )
    
    /// 宽松间距方案
    /// 适用于更好阅读体验的界面
    static let comfortable = MacSpacing(
        xs: 6,
        sm: 12,
        md: 16,
        lg: 20,
        xl: 24,
        xxl: 32,
        xxxl: 40,
        componentPadding: EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20),
        cardPadding: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20),
        buttonPadding: EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20),
        inputPadding: EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16),
        modalPadding: EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32),
        sectionSpacing: 40,
        groupSpacing: 20,
        itemSpacing: 12,
        lineSpacing: 6
    )
}

// MARK: - 间距工具方法

public extension MacSpacing {
    /// 获取指定倍数的基础间距
    /// - Parameter multiplier: 倍数
    /// - Returns: 计算后的间距值
    func spacing(_ multiplier: CGFloat) -> CGFloat {
        return xs * multiplier
    }
    
    /// 获取垂直堆叠的间距
    /// - Parameter count: 元素数量
    /// - Returns: 适合垂直堆叠的间距
    func verticalSpacing(for count: Int) -> CGFloat {
        switch count {
        case 0...2: return sm
        case 3...5: return md
        case 6...10: return lg
        default: return xl
        }
    }
    
    /// 获取水平排列的间距
    /// - Parameter count: 元素数量
    /// - Returns: 适合水平排列的间距
    func horizontalSpacing(for count: Int) -> CGFloat {
        switch count {
        case 0...3: return sm
        case 4...6: return md
        default: return lg
        }
    }
}

// MARK: - EdgeInsets扩展

public extension EdgeInsets {
    /// 创建相等的四边间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func all(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: value, leading: value, bottom: value, trailing: value)
    }
    
    /// 创建垂直间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func vertical(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: value, leading: 0, bottom: value, trailing: 0)
    }
    
    /// 创建水平间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func horizontal(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
    }
    
    /// 创建顶部间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func top(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: value, leading: 0, bottom: 0, trailing: 0)
    }
    
    /// 创建底部间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func bottom(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: value, trailing: 0)
    }
    
    /// 创建左侧间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func leading(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: 0)
    }
    
    /// 创建右侧间距
    /// - Parameter value: 间距值
    /// - Returns: EdgeInsets实例
    static func trailing(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: value)
    }
} 