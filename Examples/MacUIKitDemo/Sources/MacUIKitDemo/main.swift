//
//  main.swift
//  MacUIKitDemo
//
//  Created by MacUIKit Team on 2024/12/01.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI
import MacUIKit

@main
struct MacUIKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 800, minHeight: 600)
        }
        .windowStyle(.automatic)
        .windowToolbarStyle(.automatic)
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationSplitView {
                // 侧边栏
                SidebarView(selectedTab: $selectedTab)
            } detail: {
                // 主内容区域
                DetailView(selectedTab: selectedTab)
            }
            .macTheme(.light)
        } else {
            // macOS 12.0 兼容版本
            HStack(spacing: 0) {
                // 侧边栏
                SidebarView(selectedTab: $selectedTab)
                    .frame(width: 250)
                    .background(Color(NSColor.controlBackgroundColor))
                
                Divider()
                
                // 主内容区域
                DetailView(selectedTab: selectedTab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .macTheme(.light)
        }
    }
}

struct SidebarView: View {
    @Binding var selectedTab: Int
    
    private let menuItems = [
        MenuItem(id: 0, title: "欢迎", icon: "house.fill"),
        MenuItem(id: 1, title: "基础组件", icon: "square.grid.3x3.fill"),
        MenuItem(id: 2, title: "布局组件", icon: "rectangle.3.group.fill"),
        MenuItem(id: 3, title: "反馈组件", icon: "bubble.left.fill"),
        MenuItem(id: 4, title: "主题系统", icon: "paintpalette.fill"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 标题
            HStack {
                Text("MacUIKit")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Text("Demo")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Divider()
            
            // 菜单项
            ForEach(menuItems) { item in
                Button(action: {
                    selectedTab = item.id
                }) {
                    HStack {
                        Image(systemName: item.icon)
                            .frame(width: 20)
                        Text(item.title)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(
                        selectedTab == item.id ? 
                        Color.accentColor.opacity(0.1) : 
                        Color.clear
                    )
                    .cornerRadius(6)
                }
                .buttonStyle(.plain)
                .foregroundColor(selectedTab == item.id ? .accentColor : .primary)
            }
            
            Spacer()
            
            // 底部信息
            VStack(alignment: .leading, spacing: 4) {
                Text("版本: \(MacUIKit.version)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("MacOS UI组件库")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .frame(minWidth: 200, maxWidth: 250)
    }
}

struct DetailView: View {
    let selectedTab: Int
    
    var body: some View {
        Group {
            switch selectedTab {
            case 0:
                WelcomeView()
            case 1:
                BasicComponentsView()
            case 2:
                LayoutComponentsView()
            case 3:
                FeedbackComponentsView()
            case 4:
                ThemeSystemView()
            default:
                WelcomeView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - 欢迎页面

struct WelcomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 头部
                VStack(spacing: 16) {
                    Image(systemName: "swift")
                        .font(.system(size: 80))
                        .foregroundColor(.accentColor)
                    
                    Text("欢迎使用 MacUIKit")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("现代化的 MacOS UI 组件库")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text("基于 SwiftUI 构建，采用扁平化设计，完全对标 MacOS 原生体验")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                // 特性介绍
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    FeatureCard(
                        icon: "paintbrush.fill",
                        title: "扁平化设计",
                        description: "符合现代 MacOS 设计准则的视觉风格"
                    )
                    
                    FeatureCard(
                        icon: "swift",
                        title: "SwiftUI 原生",
                        description: "基于 SwiftUI 框架，提供声明式 UI 开发体验"
                    )
                    
                    FeatureCard(
                        icon: "moon.fill",
                        title: "主题系统",
                        description: "支持浅色/深色模式，可定制的设计令牌"
                    )
                    
                    FeatureCard(
                        icon: "accessibility",
                        title: "无障碍支持",
                        description: "完整的 VoiceOver 和键盘导航支持"
                    )
                }
                .padding(.horizontal)
                
                // 快速开始
                VStack(spacing: 16) {
                    Text("快速开始")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("在左侧菜单中选择不同的组件分类，探索 MacUIKit 的强大功能。")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .padding(.vertical, 40)
        }
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.accentColor)
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.secondary.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 基础组件页面

struct BasicComponentsView: View {
    @State private var clickCount = 0
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("基础组件")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("MacUIKit 提供的基础 UI 组件，包括按钮、输入框、标签等常用组件。")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                // 按钮组件展示
                ComponentSection(title: "MacButton - 按钮组件") {
                    VStack(alignment: .leading, spacing: 20) {
                        // 基本样式
                        VStack(alignment: .leading, spacing: 12) {
                            Text("基本样式")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 16) {
                                MacButton("Primary") {
                                    clickCount += 1
                                }
                                .style(.primary)
                                
                                MacButton("Secondary") {
                                    clickCount += 1
                                }
                                .style(.secondary)
                                
                                MacButton("Text") {
                                    clickCount += 1
                                }
                                .style(.text)
                                
                                MacButton("Destructive") {
                                    showAlert = true
                                }
                                .style(.destructive)
                            }
                        }
                        
                        // 不同尺寸
                        VStack(alignment: .leading, spacing: 12) {
                            Text("不同尺寸")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 16) {
                                MacButton("Small") {
                                    clickCount += 1
                                }
                                .style(.primary)
                                .size(.small)
                                
                                MacButton("Medium") {
                                    clickCount += 1
                                }
                                .style(.primary)
                                .size(.medium)
                                
                                MacButton("Large") {
                                    clickCount += 1
                                }
                                .style(.primary)
                                .size(.large)
                            }
                        }
                        
                        // 状态展示
                        VStack(alignment: .leading, spacing: 12) {
                            Text("状态展示")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 16) {
                                MacButton("Enabled") {
                                    clickCount += 1
                                }
                                .style(.primary)
                                
                                MacButton("Disabled") {
                                    // 不会执行
                                }
                                .style(.primary)
                                .disabled(true)
                            }
                        }
                        
                        // 交互计数器
                        VStack(alignment: .leading, spacing: 12) {
                            Text("交互测试")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack {
                                Text("点击次数: \(clickCount)")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                MacButton("Reset") {
                                    clickCount = 0
                                }
                                .style(.secondary)
                                .size(.small)
                            }
                        }
                        
                        // 使用代码示例
                        VStack(alignment: .leading, spacing: 8) {
                            Text("使用代码")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("```swift")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text("MacButton(\"Click Me\") {")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text("    print(\"Button clicked!\")")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text("}")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(".style(.primary)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(".size(.medium)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text("```")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }
                
                // 输入组件展示
                ComponentSection(title: "输入组件") {
                    Text("MacTextField 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
                
                // 显示组件展示
                ComponentSection(title: "显示组件") {
                    Text("MacLabel 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .padding(.vertical)
        }
        .alert("危险操作", isPresented: $showAlert) {
            Button("取消", role: .cancel) { }
            Button("确认删除", role: .destructive) {
                clickCount = 0
            }
        } message: {
            Text("您点击了删除按钮，这通常用于危险操作。")
        }
    }
}

// MARK: - 布局组件页面

struct LayoutComponentsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("布局组件")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("用于构建复杂布局的容器和导航组件。")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                ComponentSection(title: "容器组件") {
                    Text("MacCard、MacPanel 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
                
                ComponentSection(title: "导航组件") {
                    Text("MacTabView、MacSidebar 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .padding(.vertical)
        }
    }
}

// MARK: - 反馈组件页面

struct FeedbackComponentsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("反馈组件")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("为用户提供反馈信息的对话框、通知和状态组件。")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                ComponentSection(title: "对话框组件") {
                    Text("MacAlert、MacDialog 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
                
                ComponentSection(title: "通知组件") {
                    Text("MacToast、MacTooltip 组件即将推出...")
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .padding(.vertical)
        }
    }
}

// MARK: - 主题系统页面

struct ThemeSystemView: View {
    @State private var isDarkMode = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("主题系统")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("MacUIKit 的完整设计系统，包括色彩、字体、间距等设计令牌。")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                // 主题切换
                ComponentSection(title: "主题切换") {
                    HStack {
                        Text("主题模式:")
                        Toggle("深色模式", isOn: $isDarkMode)
                            .toggleStyle(.switch)
                    }
                }
                
                // 色彩系统展示
                ComponentSection(title: "色彩系统") {
                    ColorSystemView()
                }
                
                // 字体系统展示
                ComponentSection(title: "字体系统") {
                    TypographySystemView()
                }
            }
            .padding(.vertical)
        }
        .macTheme(isDarkMode ? .dark : .light)
    }
}

struct ColorSystemView: View {
    @Environment(\.macTheme) var theme
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            ColorSwatch(name: "Primary", color: theme.colors.primary)
            ColorSwatch(name: "Success", color: theme.colors.success)
            ColorSwatch(name: "Warning", color: theme.colors.warning)
            ColorSwatch(name: "Error", color: theme.colors.error)
            ColorSwatch(name: "Info", color: theme.colors.info)
            ColorSwatch(name: "Background", color: theme.colors.background)
        }
    }
}

struct ColorSwatch: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Rectangle()
                .fill(color)
                .frame(height: 40)
                .cornerRadius(6)
            
            Text(name)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct TypographySystemView: View {
    @Environment(\.macTheme) var theme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TypographyExample(name: "Large Title", font: theme.typography.largeTitle)
            TypographyExample(name: "Title 1", font: theme.typography.title1)
            TypographyExample(name: "Title 2", font: theme.typography.title2)
            TypographyExample(name: "Headline", font: theme.typography.headline)
            TypographyExample(name: "Body", font: theme.typography.body)
            TypographyExample(name: "Caption", font: theme.typography.caption1)
        }
    }
}

struct TypographyExample: View {
    let name: String
    let font: Font
    
    var body: some View {
        HStack {
            Text(name)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)
            
            Text("Sample Text 示例文本")
                .font(font)
        }
    }
}

// MARK: - 辅助组件

struct ComponentSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 16) {
                content
            }
            .padding()
            .background(Color.secondary.opacity(0.05))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

// MARK: - 数据模型

struct MenuItem: Identifiable {
    let id: Int
    let title: String
    let icon: String
}
