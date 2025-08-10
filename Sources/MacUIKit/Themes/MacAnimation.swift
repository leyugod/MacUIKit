//
//  MacAnimation.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit动画系统
/// 提供统一的动画配置，确保界面动效的一致性和流畅性
public struct MacAnimation {
    // MARK: - 动画配置
    public struct AnimationConfig {
        public let duration: Double
        public let curve: Animation
        public let delay: Double
        
        public init(
            duration: Double,
            curve: Animation,
            delay: Double = 0
        ) {
            self.duration = duration
            self.curve = curve
            self.delay = delay
        }
    }
    
    // MARK: - 基础动画
    public let immediate: AnimationConfig   // 立即动画
    public let fast: AnimationConfig        // 快速动画
    public let standard: AnimationConfig    // 标准动画
    public let slow: AnimationConfig        // 慢速动画
    public let gentle: AnimationConfig      // 温和动画
    
    // MARK: - 特殊动画
    public let spring: AnimationConfig      // 弹簧动画
    public let bounce: AnimationConfig      // 弹跳动画
    public let smooth: AnimationConfig      // 平滑动画
    public let sharp: AnimationConfig       // 锐利动画
    
    // MARK: - 初始化器
    public init(
        immediate: AnimationConfig = AnimationConfig(
            duration: 0.05,
            curve: .linear
        ),
        fast: AnimationConfig = AnimationConfig(
            duration: 0.15,
            curve: .easeInOut
        ),
        standard: AnimationConfig = AnimationConfig(
            duration: 0.25,
            curve: .easeInOut
        ),
        slow: AnimationConfig = AnimationConfig(
            duration: 0.35,
            curve: .easeInOut
        ),
        gentle: AnimationConfig = AnimationConfig(
            duration: 0.5,
            curve: .easeOut
        ),
        spring: AnimationConfig = AnimationConfig(
            duration: 0.6,
            curve: .spring(response: 0.6, dampingFraction: 0.8)
        ),
        bounce: AnimationConfig = AnimationConfig(
            duration: 0.8,
            curve: .spring(response: 0.3, dampingFraction: 0.6)
        ),
        smooth: AnimationConfig = AnimationConfig(
            duration: 0.4,
            curve: .easeInOut
        ),
        sharp: AnimationConfig = AnimationConfig(
            duration: 0.2,
            curve: .easeIn
        )
    ) {
        self.immediate = immediate
        self.fast = fast
        self.standard = standard
        self.slow = slow
        self.gentle = gentle
        self.spring = spring
        self.bounce = bounce
        self.smooth = smooth
        self.sharp = sharp
    }
}

// MARK: - 预定义动画方案

public extension MacAnimation {
    /// 默认动画方案
    /// 适中的动画速度，符合MacOS交互习惯
    static let `default` = MacAnimation()
    
    /// 快速动画方案
    /// 更快的动画速度，适合频繁交互
    static let responsive = MacAnimation(
        immediate: AnimationConfig(duration: 0.03, curve: .linear),
        fast: AnimationConfig(duration: 0.1, curve: .easeInOut),
        standard: AnimationConfig(duration: 0.18, curve: .easeInOut),
        slow: AnimationConfig(duration: 0.25, curve: .easeInOut),
        gentle: AnimationConfig(duration: 0.35, curve: .easeOut),
        spring: AnimationConfig(duration: 0.4, curve: .spring(response: 0.4, dampingFraction: 0.8)),
        bounce: AnimationConfig(duration: 0.6, curve: .spring(response: 0.25, dampingFraction: 0.6)),
        smooth: AnimationConfig(duration: 0.3, curve: .easeInOut),
        sharp: AnimationConfig(duration: 0.15, curve: .easeIn)
    )
    
    /// 缓慢动画方案
    /// 更慢的动画速度，适合展示性动画
    static let relaxed = MacAnimation(
        immediate: AnimationConfig(duration: 0.1, curve: .linear),
        fast: AnimationConfig(duration: 0.25, curve: .easeInOut),
        standard: AnimationConfig(duration: 0.4, curve: .easeInOut),
        slow: AnimationConfig(duration: 0.6, curve: .easeInOut),
        gentle: AnimationConfig(duration: 0.8, curve: .easeOut),
        spring: AnimationConfig(duration: 1.0, curve: .spring(response: 0.8, dampingFraction: 0.8)),
        bounce: AnimationConfig(duration: 1.2, curve: .spring(response: 0.4, dampingFraction: 0.6)),
        smooth: AnimationConfig(duration: 0.7, curve: .easeInOut),
        sharp: AnimationConfig(duration: 0.3, curve: .easeIn)
    )
}

// MARK: - 动画工具方法

public extension MacAnimation {
    /// 获取延迟动画配置
    /// - Parameters:
    ///   - config: 基础动画配置
    ///   - delay: 延迟时间
    /// - Returns: 带延迟的动画配置
    func delayed(_ config: AnimationConfig, by delay: Double) -> AnimationConfig {
        return AnimationConfig(
            duration: config.duration,
            curve: config.curve,
            delay: delay
        )
    }
    
    /// 获取自定义持续时间的动画
    /// - Parameters:
    ///   - config: 基础动画配置
    ///   - duration: 新的持续时间
    /// - Returns: 新的动画配置
    func withDuration(_ config: AnimationConfig, duration: Double) -> AnimationConfig {
        return AnimationConfig(
            duration: duration,
            curve: config.curve,
            delay: config.delay
        )
    }
}

// MARK: - View扩展

public extension View {
    /// 应用MacUIKit动画
    /// - Parameters:
    ///   - config: 动画配置
    ///   - value: 动画触发值
    /// - Returns: 应用动画后的视图
    func macAnimation<V: Equatable>(_ config: MacAnimation.AnimationConfig, value: V) -> some View {
        animation(config.curve, value: value)
    }
    
    /// 应用带延迟的动画
    /// - Parameters:
    ///   - config: 动画配置
    ///   - value: 动画触发值
    /// - Returns: 应用动画后的视图
    func macDelayedAnimation<V: Equatable>(_ config: MacAnimation.AnimationConfig, value: V) -> some View {
        animation(config.curve.delay(config.delay), value: value)
    }
}

// MARK: - 语义化动画扩展

public extension MacAnimation {
    /// 按钮交互动画
    var buttonInteraction: AnimationConfig { fast }
    
    /// 悬浮效果动画
    var hover: AnimationConfig { fast }
    
    /// 按压效果动画
    var press: AnimationConfig { immediate }
    
    /// 页面转场动画
    var pageTransition: AnimationConfig { standard }
    
    /// 模态框显示动画
    var modalPresentation: AnimationConfig { smooth }
    
    /// 工具提示动画
    var tooltip: AnimationConfig { fast }
    
    /// 列表项动画
    var listItem: AnimationConfig { standard }
    
    /// 加载状态动画
    var loading: AnimationConfig { gentle }
    
    /// 成功状态动画
    var success: AnimationConfig { bounce }
    
    /// 错误状态动画
    var error: AnimationConfig { sharp }
    
    /// 导航动画
    var navigation: AnimationConfig { standard }
    
    /// 标签页切换动画
    var tabSwitch: AnimationConfig { smooth }
    
    /// 折叠展开动画
    var collapse: AnimationConfig { smooth }
    
    /// 拖拽动画
    var drag: AnimationConfig { spring }
}

// MARK: - 动画预设组合

public extension MacAnimation {
    /// 创建序列动画配置
    /// - Parameter configs: 动画配置数组
    /// - Returns: 序列动画配置
    static func sequence(_ configs: [AnimationConfig]) -> [AnimationConfig] {
        var sequencedConfigs: [AnimationConfig] = []
        var totalDelay: Double = 0
        
        for config in configs {
            let sequencedConfig = AnimationConfig(
                duration: config.duration,
                curve: config.curve,
                delay: totalDelay
            )
            sequencedConfigs.append(sequencedConfig)
            totalDelay += config.duration + config.delay
        }
        
        return sequencedConfigs
    }
    
    /// 创建交错动画配置
    /// - Parameters:
    ///   - config: 基础动画配置
    ///   - count: 元素数量
    ///   - stagger: 交错延迟
    /// - Returns: 交错动画配置数组
    static func staggered(_ config: AnimationConfig, count: Int, stagger: Double = 0.1) -> [AnimationConfig] {
        return (0..<count).map { index in
            AnimationConfig(
                duration: config.duration,
                curve: config.curve,
                delay: Double(index) * stagger
            )
        }
    }
} 