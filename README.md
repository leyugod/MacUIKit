# MacUIKit - MacOS原生UI组件库

> 基于SwiftUI的现代化MacOS UI组件库，采用扁平化设计，完全对标MacOS原生体验

## 🎯 项目愿景

MacUIKit致力于为MacOS应用开发者提供一套完整、现代化的UI组件库，通过统一的设计系统和高质量的组件实现，显著提升MacOS应用的开发效率和用户体验。

## ✨ 核心特性

- **🎨 扁平化设计** - 符合现代MacOS设计准则的视觉风格
- **🏗️ SwiftUI原生** - 基于SwiftUI框架，提供声明式UI开发体验
- **🎭 完整主题系统** - 支持浅色/深色模式，可定制的设计令牌
- **♿ 无障碍支持** - 完整的VoiceOver和键盘导航支持
- **⚡ 高性能** - 60fps流畅动画，优化的渲染性能
- **🧪 测试完备** - 80%+测试覆盖率，质量保证
- **📚 文档完善** - 详细的API文档和使用指南

## 🏛️ 架构概览

```
MacUIKit/
├── 基础组件 (Basic Components)
│   ├── 按钮系列 (Buttons)
│   ├── 输入组件 (Inputs) 
│   └── 显示组件 (Display)
├── 布局组件 (Layout Components)
│   ├── 容器组件 (Containers)
│   ├── 导航组件 (Navigation)
│   └── 列表组件 (Lists)
├── 反馈组件 (Feedback Components)
│   ├── 对话框 (Dialogs)
│   ├── 提示组件 (Notifications)
│   └── 状态组件 (Status)
├── 高级组件 (Advanced Components)
│   ├── 媒体组件 (Media)
│   ├── 图表组件 (Charts)
│   └── 编辑器 (Editors)
└── 主题系统 (Theme System)
    ├── 色彩系统 (Colors)
    ├── 字体系统 (Typography)
    └── 间距系统 (Spacing)
```

## 🎨 设计系统

### 色彩系统
- **主色调**: 系统蓝色 (#007AFF)
- **语义色彩**: 成功绿色、警告橙色、错误红色、信息蓝色
- **中性色彩**: 完整的灰度色阶
- **系统色彩**: 背景、表面、分隔符等

### 字体系统
- **主字体**: SF Pro Display / SF Pro Text
- **等宽字体**: SF Mono
- **字号规范**: 11px - 34px 完整字号体系

### 间距系统
- **基础间距**: 4px 网格系统
- **常用间距**: 8px, 12px, 16px, 20px, 24px, 32px
- **语义间距**: 组件内边距、卡片边距等

## 🧩 组件列表

### 基础组件 (50+)
| 组件类型 | 组件列表 | 状态 |
|---------|---------|------|
| **按钮** | MacButton ✅, MacIconButton, MacLinkButton | 🔥 部分实现 |
| **输入** | MacTextField, MacSecureField, MacSearchField | 🚀 规划中 |
| **选择** | MacPicker, MacCheckbox, MacRadioButton, MacToggle | 🚀 规划中 |
| **显示** | MacLabel, MacIcon, MacAvatar, MacBadge | 🚀 规划中 |

### 布局组件
| 组件类型 | 组件列表 | 状态 |
|---------|---------|------|
| **容器** | MacCard, MacPanel, MacGroup, MacDivider | 🚀 规划中 |
| **导航** | MacTabView, MacSidebar, MacBreadcrumb | 🚀 规划中 |
| **列表** | MacList, MacTable, MacGrid, MacOutline | 🚀 规划中 |

### 反馈组件
| 组件类型 | 组件列表 | 状态 |
|---------|---------|------|
| **对话框** | MacAlert, MacDialog, MacPopover | 🚀 规划中 |
| **通知** | MacToast, MacTooltip, MacMessage | 🚀 规划中 |
| **状态** | MacLoading, MacEmpty, MacError | 🚀 规划中 |

### 高级组件
| 组件类型 | 组件列表 | 状态 |
|---------|---------|------|
| **媒体** | MacImageViewer, MacVideoPlayer, MacAudioPlayer | 🚀 规划中 |
| **图表** | MacChart, MacCalendar, MacDatePicker | 🚀 规划中 |
| **编辑器** | MacRichTextEditor, MacCodeEditor, MacMarkdownEditor | 🚀 规划中 |

## 🚀 快速开始

### 系统要求
- macOS 12.0+
- Xcode 14.0+
- Swift 5.7+

### 安装方法

**Swift Package Manager**
```swift
dependencies: [
    .package(url: "https://github.com/yourusername/MacUIKit.git", from: "1.0.0")
]
```

**Xcode集成**
1. File → Add Package Dependencies
2. 输入: `https://github.com/yourusername/MacUIKit.git`
3. 选择版本并添加到项目

### 基础使用

```swift
import SwiftUI
import MacUIKit

struct ContentView: View {
    @State private var clickCount = 0
    
    var body: some View {
        VStack(spacing: 20) {
            // 不同样式的按钮
            MacButton("主要按钮", style: .primary) {
                clickCount += 1
                print("主要按钮被点击")
            }
            
            MacButton("次要按钮", style: .secondary) {
                clickCount += 1
                print("次要按钮被点击")
            }
            
            MacButton("文本按钮", style: .text) {
                clickCount += 1
                print("文本按钮被点击")
            }
            
            MacButton("危险操作", style: .destructive) {
                print("危险操作被点击")
            }
            
            // 不同尺寸
            HStack(spacing: 12) {
                MacButton("小", size: .small) { }
                MacButton("中", size: .medium) { }
                MacButton("大", size: .large) { }
            }
            
            Text("点击次数: \(clickCount)")
                .foregroundColor(.secondary)
        }
        .padding()
        .macTheme(.light) // 应用主题
    }
}
```

## 📖 文档结构

本项目包含完整的文档体系，帮助您深入了解和使用MacUIKit：

### 核心文档
- **[MRD.md](./MRD.md)** - 市场需求文档，详细分析项目背景、市场需求和产品规格
- **[技术设计规范.md](./技术设计规范.md)** - 技术架构设计、组件规范和实现细节
- **[项目实施计划.md](./项目实施计划.md)** - 完整的项目开发计划和里程碑规划

### 使用指南 (即将发布)
- **快速开始指南** - 5分钟上手MacUIKit
- **组件使用手册** - 每个组件的详细使用说明
- **主题定制指南** - 如何创建和应用自定义主题
- **最佳实践** - 推荐的使用模式和技巧
- **迁移指南** - 从其他UI库迁移到MacUIKit

### API参考 (即将发布)
- **完整API文档** - 所有组件的API参考
- **类型定义** - 枚举、结构体和协议说明
- **示例代码** - 每个API的使用示例

## 🛣️ 开发路线图

### Phase 1: 基础建设 (Month 1-2) 🚀
- [x] 项目架构设计
- [x] 基础组件开发 (MacButton ✅)
- [x] 主题系统实现
- [x] 单元测试框架

### Phase 2: 组件扩展 (Month 3-5) 📅
- [ ] 布局组件开发
- [ ] 导航组件实现  
- [ ] 列表和表格组件
- [ ] 反馈组件开发

### Phase 3: 高级特性 (Month 6-7) 🔮
- [ ] 媒体组件开发
- [ ] 图表和数据可视化
- [ ] 富文本和代码编辑器
- [ ] 动画系统完善

### Phase 4: 优化发布 (Month 8-9) ✨
- [ ] 性能优化
- [ ] 测试覆盖完善
- [ ] 文档和示例完善
- [ ] 1.0正式版发布

## 🤝 贡献指南

我们欢迎社区贡献！无论是bug报告、功能建议还是代码贡献，都能帮助MacUIKit变得更好。

### 如何贡献
1. **Fork项目** - 创建您的项目分支
2. **创建分支** - 为您的功能创建一个分支 (`git checkout -b feature/AmazingFeature`)
3. **提交代码** - 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. **推送分支** - 推送到您的分支 (`git push origin feature/AmazingFeature`)
5. **创建PR** - 创建一个Pull Request

### 贡献类型
- 🐛 **Bug修复** - 修复现有问题
- ✨ **新功能** - 添加新的组件或功能  
- 📚 **文档改进** - 改善文档和示例
- 🎨 **设计优化** - 改进UI/UX设计
- ⚡ **性能优化** - 提升组件性能
- 🧪 **测试增强** - 增加测试覆盖率

## 📊 项目状态

| 指标 | 当前状态 | 目标 |
|------|----------|------|
| 组件数量 | 0/50+ | 50+ |
| 测试覆盖率 | 0% | 80%+ |
| 文档覆盖率 | 60% | 100% |
| 性能指标 | - | 60fps |
| 社区支持 | 筹备中 | 活跃社区 |

## 🏆 项目目标

### 短期目标 (6个月)
- ✅ 完成项目架构设计
- 🚧 发布Alpha版本 (基础组件)
- 🚧 建立开发者社区
- 🚧 获得100+项目使用

### 长期目标 (12个月)
- 🎯 发布1.0稳定版本
- 🎯 获得1000+ GitHub Stars
- 🎯 建立生态系统
- 🎯 成为MacOS开发标准UI库

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

感谢所有为MacUIKit项目做出贡献的开发者和设计师，以及Apple公司提供的优秀SwiftUI框架。

## 📞 联系我们

- **项目主页**: https://github.com/yourusername/MacUIKit
- **问题反馈**: https://github.com/yourusername/MacUIKit/issues
- **讨论区**: https://github.com/yourusername/MacUIKit/discussions
- **邮箱**: macuikit@example.com

---

**让我们一起构建更好的MacOS应用体验！** 🚀

---

<div align="center">

**MacUIKit** - 让MacOS应用开发更简单、更优雅

[![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-macOS%2012.0+-blue.svg)](https://developer.apple.com/macos/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-✓-green.svg)](https://developer.apple.com/xcode/swiftui/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div> 