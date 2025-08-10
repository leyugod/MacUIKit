//
//  MacUIKitUITests.swift
//  MacUIKitUITests
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import XCTest
import SwiftUI
@testable import MacUIKit

/// MacUIKit UI测试
/// 测试UI组件的交互行为和可访问性
final class MacUIKitUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // 在每个测试方法前运行的设置代码
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // 在每个测试方法后运行的清理代码
    }
    
    // MARK: - 基础UI测试
    
    func testMacUIKitVersionDisplay() throws {
        // 测试MacUIKit版本信息显示
        let version = MacUIKit.version
        XCTAssertFalse(version.isEmpty, "版本号不应该为空")
        XCTAssertTrue(version.contains("."), "版本号应该包含版本分隔符")
    }
    
    func testMacUIKitLibraryInfo() throws {
        // 测试库信息
        let info = MacUIKit.info
        XCTAssertTrue(info.contains(MacUIKit.name), "库信息应该包含库名称")
        XCTAssertTrue(info.contains(MacUIKit.version), "库信息应该包含版本号")
        XCTAssertTrue(info.contains(MacUIKit.description), "库信息应该包含描述")
    }
    
    // MARK: - 主题系统测试
    
    func testMacThemeCreation() throws {
        // 测试主题创建
        let lightTheme = MacTheme.light
        let darkTheme = MacTheme.dark
        
        XCTAssertNotNil(lightTheme.colors, "浅色主题应该有颜色配置")
        XCTAssertNotNil(darkTheme.colors, "深色主题应该有颜色配置")
        XCTAssertNotEqual(lightTheme.colors.background, darkTheme.colors.background, "浅色和深色主题的背景色应该不同")
    }
    
    func testMacColorsSystem() throws {
        // 测试色彩系统
        let lightColors = MacColors.light
        let darkColors = MacColors.dark
        
        // 测试主色调
        XCTAssertNotNil(lightColors.primary, "浅色主题应该有主色调")
        XCTAssertNotNil(darkColors.primary, "深色主题应该有主色调")
        
        // 测试语义色彩
        XCTAssertNotNil(lightColors.success, "应该有成功色彩")
        XCTAssertNotNil(lightColors.warning, "应该有警告色彩")
        XCTAssertNotNil(lightColors.error, "应该有错误色彩")
        XCTAssertNotNil(lightColors.info, "应该有信息色彩")
        
        // 测试色彩工具方法
        let disabledColor = lightColors.disabledColor(for: lightColors.primary)
        XCTAssertNotNil(disabledColor, "应该能生成禁用状态色彩")
    }
    
    func testMacTypographySystem() throws {
        // 测试字体系统
        let typography = MacTypography.default
        
        XCTAssertNotNil(typography.largeTitle, "应该有大标题字体")
        XCTAssertNotNil(typography.title1, "应该有标题1字体")
        XCTAssertNotNil(typography.body, "应该有正文字体")
        XCTAssertNotNil(typography.caption1, "应该有说明文字字体")
        XCTAssertNotNil(typography.code, "应该有代码字体")
        
        // 测试语义化字体
        XCTAssertNotNil(typography.buttonLabel, "应该有按钮标签字体")
        XCTAssertNotNil(typography.navigationTitle, "应该有导航标题字体")
    }
    
    func testMacSpacingSystem() throws {
        // 测试间距系统
        let spacing = MacSpacing.default
        
        XCTAssertGreaterThan(spacing.xs, 0, "最小间距应该大于0")
        XCTAssertGreaterThan(spacing.sm, spacing.xs, "小间距应该大于最小间距")
        XCTAssertGreaterThan(spacing.md, spacing.sm, "中等间距应该大于小间距")
        XCTAssertGreaterThan(spacing.lg, spacing.md, "大间距应该大于中等间距")
        
        // 测试间距工具方法
        let customSpacing = spacing.spacing(2.0)
        XCTAssertEqual(customSpacing, spacing.xs * 2, "自定义倍数间距计算应该正确")
    }
    
    func testMacCornerRadiusSystem() throws {
        // 测试圆角系统
        let cornerRadius = MacCornerRadius.default
        
        XCTAssertEqual(cornerRadius.none, 0, "无圆角应该为0")
        XCTAssertGreaterThan(cornerRadius.xs, 0, "最小圆角应该大于0")
        XCTAssertGreaterThan(cornerRadius.sm, cornerRadius.xs, "小圆角应该大于最小圆角")
        
        // 测试语义化圆角
        XCTAssertGreaterThan(cornerRadius.button, 0, "按钮圆角应该大于0")
        XCTAssertGreaterThan(cornerRadius.card, 0, "卡片圆角应该大于0")
        
        // 测试自适应圆角
        let smallSize = CGSize(width: 20, height: 20)
        let adaptiveRadius = cornerRadius.adaptiveRadius(for: smallSize)
        XCTAssertGreaterThan(adaptiveRadius, 0, "自适应圆角应该大于0")
    }
    
    func testMacElevationSystem() throws {
        // 测试阴影系统
        let elevation = MacElevation.default
        
        XCTAssertEqual(elevation.none.opacity, 0, "无阴影透明度应该为0")
        XCTAssertGreaterThan(elevation.level1.opacity, 0, "1级阴影透明度应该大于0")
        XCTAssertGreaterThan(elevation.level2.opacity, elevation.level1.opacity, "2级阴影透明度应该大于1级")
        
        // 测试阴影工具方法
        let customShadow = elevation.customShadow(radius: 10, opacity: 0.2)
        XCTAssertEqual(customShadow.radius, 10, "自定义阴影半径应该正确")
        XCTAssertEqual(customShadow.opacity, 0.2, "自定义阴影透明度应该正确")
    }
    
    func testMacAnimationSystem() throws {
        // 测试动画系统
        let animation = MacAnimation.default
        
        XCTAssertGreaterThan(animation.fast.duration, 0, "快速动画持续时间应该大于0")
        XCTAssertGreaterThan(animation.standard.duration, animation.fast.duration, "标准动画持续时间应该大于快速动画")
        XCTAssertGreaterThan(animation.slow.duration, animation.standard.duration, "慢速动画持续时间应该大于标准动画")
        
        // 测试语义化动画
        XCTAssertNotNil(animation.buttonInteraction, "应该有按钮交互动画")
        XCTAssertNotNil(animation.hover, "应该有悬浮动画")
        XCTAssertNotNil(animation.modalPresentation, "应该有模态框动画")
    }
    
    // MARK: - 性能测试
    
    func testMacThemePerformance() throws {
        // 测试主题系统性能
        self.measure {
            for _ in 0..<1000 {
                let theme = MacTheme.light
                _ = theme.colors.primary
                _ = theme.typography.body
                _ = theme.spacing.md
            }
        }
    }
    
    func testColorSystemPerformance() throws {
        // 测试色彩系统性能
        let colors = MacColors.light
        
        self.measure {
            for _ in 0..<1000 {
                _ = colors.disabledColor(for: colors.primary)
                _ = colors.hoverColor(for: colors.primaryVariant)
                _ = colors.pressedColor(for: colors.success)
            }
        }
    }
    
    // MARK: - 辅助方法
    
    private func createTestView() -> some View {
        VStack {
            Text("Test View")
                .font(.title)
            Text("MacUIKit Test")
                .font(.body)
        }
        .macTheme(.light)
    }
} 