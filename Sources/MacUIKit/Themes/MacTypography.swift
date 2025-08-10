//
//  MacTypography.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit字体系统
/// 提供完整的字体规范，符合MacOS字体使用准则
public struct MacTypography {
    // MARK: - 标题字体
    public let largeTitle: Font
    public let title1: Font
    public let title2: Font
    public let title3: Font
    
    // MARK: - 内容字体
    public let headline: Font
    public let body: Font
    public let callout: Font
    public let subheadline: Font
    
    // MARK: - 辅助字体
    public let footnote: Font
    public let caption1: Font
    public let caption2: Font
    
    // MARK: - 等宽字体
    public let code: Font
    public let codeSmall: Font
    
    // MARK: - 初始化器
    public init(
        largeTitle: Font,
        title1: Font,
        title2: Font,
        title3: Font,
        headline: Font,
        body: Font,
        callout: Font,
        subheadline: Font,
        footnote: Font,
        caption1: Font,
        caption2: Font,
        code: Font,
        codeSmall: Font
    ) {
        self.largeTitle = largeTitle
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.headline = headline
        self.body = body
        self.callout = callout
        self.subheadline = subheadline
        self.footnote = footnote
        self.caption1 = caption1
        self.caption2 = caption2
        self.code = code
        self.codeSmall = codeSmall
    }
}

// MARK: - 预定义字体方案

public extension MacTypography {
    /// 默认字体方案
    /// 使用SF Pro系列字体，符合MacOS字体规范
    static let `default` = MacTypography(
        // 标题字体 - 使用SF Pro Display
        largeTitle: .system(size: 34, weight: .regular, design: .default),
        title1: .system(size: 28, weight: .regular, design: .default),
        title2: .system(size: 22, weight: .regular, design: .default),
        title3: .system(size: 20, weight: .regular, design: .default),
        
        // 内容字体 - 使用SF Pro Text
        headline: .system(size: 17, weight: .semibold, design: .default),
        body: .system(size: 17, weight: .regular, design: .default),
        callout: .system(size: 16, weight: .regular, design: .default),
        subheadline: .system(size: 15, weight: .regular, design: .default),
        
        // 辅助字体
        footnote: .system(size: 13, weight: .regular, design: .default),
        caption1: .system(size: 12, weight: .regular, design: .default),
        caption2: .system(size: 11, weight: .regular, design: .default),
        
        // 等宽字体 - 使用SF Mono
        code: .system(size: 14, weight: .regular, design: .monospaced),
        codeSmall: .system(size: 12, weight: .regular, design: .monospaced)
    )
    
    /// 紧凑字体方案
    /// 适用于信息密度较高的界面
    static let compact = MacTypography(
        largeTitle: .system(size: 30, weight: .regular, design: .default),
        title1: .system(size: 24, weight: .regular, design: .default),
        title2: .system(size: 20, weight: .regular, design: .default),
        title3: .system(size: 18, weight: .regular, design: .default),
        headline: .system(size: 15, weight: .semibold, design: .default),
        body: .system(size: 15, weight: .regular, design: .default),
        callout: .system(size: 14, weight: .regular, design: .default),
        subheadline: .system(size: 13, weight: .regular, design: .default),
        footnote: .system(size: 11, weight: .regular, design: .default),
        caption1: .system(size: 10, weight: .regular, design: .default),
        caption2: .system(size: 9, weight: .regular, design: .default),
        code: .system(size: 12, weight: .regular, design: .monospaced),
        codeSmall: .system(size: 10, weight: .regular, design: .monospaced)
    )
    
    /// 宽松字体方案
    /// 适用于阅读体验优先的界面
    static let comfortable = MacTypography(
        largeTitle: .system(size: 38, weight: .regular, design: .default),
        title1: .system(size: 32, weight: .regular, design: .default),
        title2: .system(size: 26, weight: .regular, design: .default),
        title3: .system(size: 22, weight: .regular, design: .default),
        headline: .system(size: 19, weight: .semibold, design: .default),
        body: .system(size: 19, weight: .regular, design: .default),
        callout: .system(size: 18, weight: .regular, design: .default),
        subheadline: .system(size: 17, weight: .regular, design: .default),
        footnote: .system(size: 15, weight: .regular, design: .default),
        caption1: .system(size: 14, weight: .regular, design: .default),
        caption2: .system(size: 13, weight: .regular, design: .default),
        code: .system(size: 16, weight: .regular, design: .monospaced),
        codeSmall: .system(size: 14, weight: .regular, design: .monospaced)
    )
}

// MARK: - 字体工具方法

public extension MacTypography {
    /// 获取强调版本的字体
    func bold(_ font: Font) -> Font {
        return font.weight(.bold)
    }
    
    /// 获取半粗体版本的字体
    func semibold(_ font: Font) -> Font {
        return font.weight(.semibold)
    }
    
    /// 获取细体版本的字体
    func light(_ font: Font) -> Font {
        return font.weight(.light)
    }
    
    /// 获取斜体版本的字体
    func italic(_ font: Font) -> Font {
        return font.italic()
    }
}

// MARK: - 字体语义化扩展

public extension MacTypography {
    /// 用于按钮的字体
    var buttonLabel: Font { body }
    
    /// 用于表单标签的字体
    var formLabel: Font { caption1 }
    
    /// 用于错误消息的字体
    var errorMessage: Font { caption2 }
    
    /// 用于帮助文本的字体
    var helpText: Font { footnote }
    
    /// 用于标签页标题的字体
    var tabTitle: Font { subheadline }
    
    /// 用于导航标题的字体
    var navigationTitle: Font { headline }
    
    /// 用于工具栏按钮的字体
    var toolbarButton: Font { callout }
    
    /// 用于状态栏文本的字体
    var statusText: Font { caption1 }
} 