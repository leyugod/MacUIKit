//
//  MacButton.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit 按钮组件
///
/// 符合 macOS 设计准则的现代化按钮组件，支持多种样式和状态。
///
/// ## 基本用法
///
/// ```swift
/// MacButton("点击我") {
///     print("按钮被点击了")
/// }
/// ```
///
/// ## 样式定制
///
/// ```swift
/// MacButton("主要操作", style: .primary) {
///     performPrimaryAction()
/// }
/// .size(.large)
/// .disabled(!isFormValid)
/// ```
///
/// ## 可用样式
///
/// - `.primary`: 主要操作按钮，通常用于最重要的操作
/// - `.secondary`: 次要操作按钮，用于辅助操作
/// - `.text`: 文本按钮，用于轻量级操作
/// - `.destructive`: 危险操作按钮，用于删除等破坏性操作
///
public struct MacButton: View {
    
    // MARK: - Properties
    
    private let title: String
    private let action: () -> Void
    private let style: MacButtonStyle
    private let size: MacButtonSize
    
    // MARK: - State
    
    @State private var isHovered: Bool = false
    @State private var isPressed: Bool = false
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.macTheme) private var theme
    
    // MARK: - Initialization
    
    /// 创建一个 MacButton
    /// - Parameters:
    ///   - title: 按钮显示的文本
    ///   - style: 按钮样式，默认为 `.primary`
    ///   - size: 按钮尺寸，默认为 `.medium`
    ///   - action: 点击按钮时执行的操作
    public init(
        _ title: String,
        style: MacButtonStyle = .primary,
        size: MacButtonSize = .medium,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(textFont)
                .foregroundColor(textColor)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minWidth: minWidth, minHeight: minHeight)
        }
        .buttonStyle(PlainButtonStyle())
        .background(backgroundView)
        .overlay(borderView)
        .cornerRadius(cornerRadius)
        .scaleEffect(isPressed ? pressedScale : (isHovered ? hoveredScale : 1.0))
        .animation(.easeInOut(duration: theme.animation.fast.duration), value: isPressed)
        .animation(.easeInOut(duration: theme.animation.fast.duration), value: isHovered)
        .onHover { hovering in
            isHovered = hovering
        }
        .pressEvents(
            onPress: { isPressed = true },
            onRelease: { isPressed = false }
        )
    }
}

// MARK: - Computed Properties

private extension MacButton {
    
    /// 文本字体
    var textFont: Font {
        switch size {
        case .small:
            return theme.typography.caption1
        case .medium:
            return theme.typography.body
        case .large:
            return theme.typography.headline
        }
    }
    
    /// 文本颜色
    var textColor: Color {
        guard isEnabled else {
            return theme.colors.quaternaryText
        }
        
        switch style {
        case .primary:
            return .white
        case .secondary:
            return currentBackgroundColor == .clear ? theme.colors.primary : theme.colors.onSurface
        case .text:
            return theme.colors.primary
        case .destructive:
            return style == .destructive && currentBackgroundColor != .clear ? .white : theme.colors.error
        }
    }
    
    /// 当前背景色
    var currentBackgroundColor: Color {
        guard isEnabled else {
            return style.baseBackgroundColor(theme: theme).opacity(0.3)
        }
        
        let baseColor = style.baseBackgroundColor(theme: theme)
        
        if isPressed {
            return style.pressedBackgroundColor(theme: theme)
        } else if isHovered {
            return style.hoveredBackgroundColor(theme: theme)
        } else {
            return baseColor
        }
    }
    
    /// 背景视图
    var backgroundView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(currentBackgroundColor)
    }
    
    /// 边框视图
    @ViewBuilder
    var borderView: some View {
        if style == .secondary {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: 1)
        }
    }
    
    /// 边框颜色
    var borderColor: Color {
        guard isEnabled else {
            return theme.colors.separator.opacity(0.5)
        }
        
        if isPressed {
            return theme.colors.primary.opacity(0.8)
        } else if isHovered {
            return theme.colors.primary.opacity(0.6)
        } else {
            return theme.colors.separator
        }
    }
    
    /// 圆角半径
    var cornerRadius: CGFloat {
        switch size {
        case .small:
            return theme.cornerRadius.sm
        case .medium:
            return theme.cornerRadius.md
        case .large:
            return theme.cornerRadius.lg
        }
    }
    
    /// 水平内边距
    var horizontalPadding: CGFloat {
        switch size {
        case .small:
            return theme.spacing.md
        case .medium:
            return theme.spacing.lg
        case .large:
            return theme.spacing.xl
        }
    }
    
    /// 垂直内边距
    var verticalPadding: CGFloat {
        switch size {
        case .small:
            return theme.spacing.xs
        case .medium:
            return theme.spacing.sm
        case .large:
            return theme.spacing.md
        }
    }
    
    /// 最小宽度
    var minWidth: CGFloat {
        switch size {
        case .small:
            return 60
        case .medium:
            return 80
        case .large:
            return 100
        }
    }
    
    /// 最小高度
    var minHeight: CGFloat {
        switch size {
        case .small:
            return 24
        case .medium:
            return 32
        case .large:
            return 40
        }
    }
    
    /// 按压时的缩放比例
    var pressedScale: CGFloat {
        0.96
    }
    
    /// 悬停时的缩放比例
    var hoveredScale: CGFloat {
        1.02
    }
}

// MARK: - Button Style

/// MacButton 样式枚举
public enum MacButtonStyle {
    /// 主要按钮 - 用于最重要的操作
    case primary
    /// 次要按钮 - 用于辅助操作
    case secondary
    /// 文本按钮 - 用于轻量级操作
    case text
    /// 危险操作按钮 - 用于删除等破坏性操作
    case destructive
    
    /// 基础背景色
    func baseBackgroundColor(theme: MacTheme) -> Color {
        switch self {
        case .primary:
            return theme.colors.primary
        case .secondary:
            return .clear
        case .text:
            return .clear
        case .destructive:
            return theme.colors.error
        }
    }
    
    /// 悬停状态背景色
    func hoveredBackgroundColor(theme: MacTheme) -> Color {
        switch self {
        case .primary:
            return theme.colors.primaryVariant
        case .secondary:
            return theme.colors.controlBackground
        case .text:
            return theme.colors.controlBackground.opacity(0.5)
        case .destructive:
            return theme.colors.error.opacity(0.8)
        }
    }
    
    /// 按压状态背景色
    func pressedBackgroundColor(theme: MacTheme) -> Color {
        switch self {
        case .primary:
            return theme.colors.primary.opacity(0.8)
        case .secondary:
            return theme.colors.controlBackground.opacity(0.8)
        case .text:
            return theme.colors.controlBackground.opacity(0.3)
        case .destructive:
            return theme.colors.error.opacity(0.6)
        }
    }
}

// MARK: - Button Size

/// MacButton 尺寸枚举
public enum MacButtonSize {
    /// 小尺寸
    case small
    /// 中等尺寸（默认）
    case medium
    /// 大尺寸
    case large
}

// MARK: - View Modifiers

public extension MacButton {
    /// 设置按钮样式
    func style(_ style: MacButtonStyle) -> MacButton {
        MacButton(
            title,
            style: style,
            size: size,
            action: action
        )
    }
    
    /// 设置按钮尺寸
    func size(_ size: MacButtonSize) -> MacButton {
        MacButton(
            title,
            style: style,
            size: size,
            action: action
        )
    }
}

// MARK: - Press Events Extension

private extension View {
    func pressEvents(
        onPress: @escaping () -> Void,
        onRelease: @escaping () -> Void
    ) -> some View {
        self.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    onPress()
                }
                .onEnded { _ in
                    onRelease()
                }
        )
    }
}

// MARK: - Previews

#if DEBUG
struct MacButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // 不同样式
            HStack(spacing: 16) {
                MacButton("Primary") { }
                    .style(.primary)
                
                MacButton("Secondary") { }
                    .style(.secondary)
                
                MacButton("Text") { }
                    .style(.text)
                
                MacButton("Destructive") { }
                    .style(.destructive)
            }
            
            // 不同尺寸
            HStack(spacing: 16) {
                MacButton("Small") { }
                    .size(.small)
                
                MacButton("Medium") { }
                    .size(.medium)
                
                MacButton("Large") { }
                    .size(.large)
            }
            
            // 禁用状态
            HStack(spacing: 16) {
                MacButton("Enabled") { }
                
                MacButton("Disabled") { }
                    .disabled(true)
            }
        }
        .padding()
        .macTheme(.light)
        .previewDisplayName("Light Theme")
        
        VStack(spacing: 20) {
            HStack(spacing: 16) {
                MacButton("Primary") { }
                    .style(.primary)
                
                MacButton("Secondary") { }
                    .style(.secondary)
                
                MacButton("Text") { }
                    .style(.text)
                
                MacButton("Destructive") { }
                    .style(.destructive)
            }
        }
        .padding()
        .macTheme(.dark)
        .background(Color.black)
        .previewDisplayName("Dark Theme")
    }
}
#endif
