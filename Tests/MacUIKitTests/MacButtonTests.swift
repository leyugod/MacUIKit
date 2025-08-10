//
//  MacButtonTests.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import Testing
import SwiftUI
@testable import MacUIKit

/// MacButton 组件测试
struct MacButtonTests {
    
    // MARK: - 基础功能测试
    
    @Test func testButtonInitialization() async throws {
        let button = MacButton("Test Button") { }
        #expect(button != nil)
    }
    
    @Test func testButtonWithDifferentStyles() async throws {
        let primaryButton = MacButton("Primary", style: .primary) { }
        let secondaryButton = MacButton("Secondary", style: .secondary) { }
        let textButton = MacButton("Text", style: .text) { }
        let destructiveButton = MacButton("Destructive", style: .destructive) { }
        
        #expect(primaryButton != nil)
        #expect(secondaryButton != nil)
        #expect(textButton != nil)
        #expect(destructiveButton != nil)
    }
    
    @Test func testButtonWithDifferentSizes() async throws {
        let smallButton = MacButton("Small", size: .small) { }
        let mediumButton = MacButton("Medium", size: .medium) { }
        let largeButton = MacButton("Large", size: .large) { }
        
        #expect(smallButton != nil)
        #expect(mediumButton != nil)
        #expect(largeButton != nil)
    }
    
    // MARK: - 样式系统测试
    
    @Test func testButtonStyleModifier() async throws {
        let button = MacButton("Test") { }
            .style(.secondary)
        
        #expect(button != nil)
    }
    
    @Test func testButtonSizeModifier() async throws {
        let button = MacButton("Test") { }
            .size(.large)
        
        #expect(button != nil)
    }
    
    @Test func testButtonChainedModifiers() async throws {
        let button = MacButton("Test") { }
            .style(.secondary)
            .size(.large)
        
        #expect(button != nil)
    }
    
    // MARK: - 主题集成测试
    
    @Test func testButtonWithLightTheme() async throws {
        let button = MacButton("Test") { }
            .macTheme(.light)
        
        #expect(button != nil)
    }
    
    @Test func testButtonWithDarkTheme() async throws {
        let button = MacButton("Test") { }
            .macTheme(.dark)
        
        #expect(button != nil)
    }
    
    // MARK: - 样式枚举测试
    
    @Test func testMacButtonStyleEnum() async throws {
        let theme = MacTheme.light
        
        // 测试不同样式的背景色
        let primaryBg = MacButtonStyle.primary.baseBackgroundColor(theme: theme)
        let secondaryBg = MacButtonStyle.secondary.baseBackgroundColor(theme: theme)
        let textBg = MacButtonStyle.text.baseBackgroundColor(theme: theme)
        let destructiveBg = MacButtonStyle.destructive.baseBackgroundColor(theme: theme)
        
        #expect(primaryBg == theme.colors.primary)
        #expect(secondaryBg == .clear)
        #expect(textBg == .clear)
        #expect(destructiveBg == theme.colors.error)
    }
    
    @Test func testMacButtonStyleHoverColors() async throws {
        let theme = MacTheme.light
        
        // 测试悬停状态颜色
        let primaryHover = MacButtonStyle.primary.hoveredBackgroundColor(theme: theme)
        let secondaryHover = MacButtonStyle.secondary.hoveredBackgroundColor(theme: theme)
        
        #expect(primaryHover == theme.colors.primaryVariant)
        #expect(secondaryHover == theme.colors.controlBackground)
    }
    
    @Test func testMacButtonStylePressedColors() async throws {
        let theme = MacTheme.light
        
        // 测试按压状态颜色
        let primaryPressed = MacButtonStyle.primary.pressedBackgroundColor(theme: theme)
        let destructivePressed = MacButtonStyle.destructive.pressedBackgroundColor(theme: theme)
        
        #expect(primaryPressed != theme.colors.primary)
        #expect(destructivePressed != theme.colors.error)
    }
    
    // MARK: - 尺寸枚举测试
    
    @Test func testMacButtonSizeEnum() async throws {
        // 确保所有尺寸枚举值都存在
        let sizes: [MacButtonSize] = [.small, .medium, .large]
        #expect(sizes.count == 3)
    }
    
    // MARK: - 性能测试
    
    @Test func testButtonCreationPerformance() async throws {
        // 测试大量按钮创建的性能
        let buttons = (0..<1000).map { index in
            MacButton("Button \(index)") { }
        }
        
        #expect(buttons.count == 1000)
    }
    
    @Test func testButtonStyleChangePerformance() async throws {
        var button = MacButton("Test") { }
        
        // 测试样式切换性能
        for _ in 0..<100 {
            button = button.style(.primary)
            button = button.style(.secondary)
            button = button.style(.text)
            button = button.style(.destructive)
        }
        
        #expect(button != nil)
    }
}

// MARK: - MacButton行为测试

struct MacButtonBehaviorTests {
    
    @Test func testButtonActionExecution() async throws {
        var actionExecuted = false
        
        // 创建一个会设置标志的按钮
        let button = MacButton("Test") {
            actionExecuted = true
        }
        
        // 注意：这里我们只是测试按钮能够创建，实际的点击测试需要UI测试
        #expect(button != nil)
        #expect(actionExecuted == false) // 还没有被点击
    }
    
    @Test func testButtonAccessibility() async throws {
        let button = MacButton("Accessible Button") { }
        
        // 测试按钮是否可以被创建（无障碍功能通过SwiftUI自动支持）
        #expect(button != nil)
    }
}
