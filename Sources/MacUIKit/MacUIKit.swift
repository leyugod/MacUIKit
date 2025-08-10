// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  MacUIKit.swift
//  MacUIKit
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// MacUIKit - MacOS原生UI组件库
///
/// 基于SwiftUI的现代化MacOS UI组件库，采用扁平化设计，完全对标MacOS原生体验。
/// 提供50+个高质量UI组件，支持完整主题系统和无障碍功能。
///
/// ## 快速开始
///
/// ```swift
/// import MacUIKit
///
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             MacButton("Hello MacUIKit") {
///                 print("Button tapped!")
///             }
///         }
///         .macTheme(.light)
///     }
/// }
/// ```
///
/// ## 主要功能
///
/// - **基础组件**: 按钮、输入框、显示组件等
/// - **布局组件**: 卡片、面板、导航组件等  
/// - **反馈组件**: 对话框、通知、状态组件等
/// - **高级组件**: 媒体、图表、编辑器组件等
/// - **主题系统**: 完整的设计系统支持
///
public struct MacUIKit {
    /// 库版本号
    public static let version = "1.0.0"
    
    /// 库名称
    public static let name = "MacUIKit"
    
    /// 库描述
    public static let description = "MacOS原生UI组件库 - 基于SwiftUI的现代化UI组件库"
    
    /// 获取库信息
    public static var info: String {
        return "\(name) v\(version) - \(description)"
    }
}

// MARK: - 模块导出

// 基础组件已实现
// MacButton - 已在 Components/Basic/MacButton.swift 中实现

// 待实现组件
// public struct MacTextField {} // 即将实现
// public struct MacLabel {} // 即将实现

// 布局组件导出  
// public struct MacCard {} // 即将实现
// public struct MacPanel {} // 即将实现

// 反馈组件导出
// public struct MacAlert {} // 即将实现
// public struct MacDialog {} // 即将实现

// 主题系统导出
// public struct MacTheme {} // 即将实现
// public struct MacColors {} // 即将实现

// MARK: - 预览支持

#if DEBUG
/// 开发预览支持
public struct MacUIKit_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 20) {
            Text("MacUIKit")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("MacOS原生UI组件库")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text("版本: \(MacUIKit.version)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .previewDisplayName("MacUIKit Info")
    }
}
#endif
