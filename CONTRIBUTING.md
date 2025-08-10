# Contributing to MacUIKit

我们欢迎任何形式的贡献！无论是bug报告、功能建议、文档改进还是代码贡献，都将帮助MacUIKit变得更好。

## 🤝 贡献方式

### Bug报告
如果您发现了bug，请：
1. 检查是否已有相关issue
2. 创建详细的bug报告，包括：
   - 复现步骤
   - 期望行为
   - 实际行为
   - 系统环境信息
   - 相关截图或代码

### 功能建议
如果您有新功能想法：
1. 先创建issue讨论
2. 描述使用场景和预期效果
3. 等待社区反馈后再开始实现

### 代码贡献
1. Fork项目
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 遵循编码规范
4. 添加测试
5. 提交更改 (`git commit -m 'Add amazing feature'`)
6. 推送分支 (`git push origin feature/amazing-feature`)
7. 创建Pull Request

## 📋 开发环境设置

### 系统要求
- macOS 12.0+
- Xcode 14.0+
- Swift 5.7+

### 本地开发
```bash
# 克隆项目
git clone https://github.com/yourusername/MacUIKit.git
cd MacUIKit

# 打开项目
open Package.swift

# 运行测试
swift test

# 运行演示应用
cd Examples/MacUIKitDemo
open MacUIKitDemo.xcodeproj
```

## 🎨 编码规范

### Swift编码风格
- 遵循[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- 使用SwiftLint进行代码检查
- 保持一致的命名规范

### 代码结构
```swift
// 文件头部注释
//
//  ComponentName.swift
//  MacUIKit
//
//  Created by Contributor Name on Date.
//  Copyright © 2024 MacUIKit. All rights reserved.
//

import SwiftUI

/// 组件描述
///
/// 详细说明组件的用途和功能。
///
/// ## 基本用法
///
/// ```swift
/// ComponentName(parameter: value) {
///     // 使用示例
/// }
/// ```
public struct ComponentName: View {
    // 私有属性
    private let parameter: Type
    
    // 状态属性
    @State private var internalState: Bool = false
    
    // 环境属性
    @Environment(\.macTheme) private var theme
    
    // 公开初始化器
    public init(parameter: Type) {
        self.parameter = parameter
    }
    
    // 视图主体
    public var body: some View {
        // 实现内容
    }
}

// MARK: - 预览
#if DEBUG
struct ComponentName_Previews: PreviewProvider {
    static var previews: some View {
        ComponentName(parameter: sampleValue)
            .previewDisplayName("Component Preview")
    }
}
#endif
```

### 文档规范
- 所有公开API必须有文档注释
- 提供使用示例
- 说明参数和返回值
- 包含预览代码

## ✅ 测试规范

### 单元测试
- 每个组件都应有对应的测试文件
- 测试覆盖率应达到80%以上
- 测试文件命名：`ComponentNameTests.swift`

### 测试示例
```swift
import Testing
@testable import MacUIKit

struct ComponentNameTests {
    @Test func testInitialization() async throws {
        let component = ComponentName(parameter: testValue)
        #expect(component != nil)
    }
    
    @Test func testBehavior() async throws {
        // 测试组件行为
    }
}
```

## 📝 文档贡献

### API文档
- 使用Swift文档注释格式
- 包含代码示例
- 说明使用场景

### 用户指南
- 使用清晰的语言
- 提供完整的示例
- 包含常见问题解答

## 🚀 发布流程

### 版本规范
- 遵循[语义化版本控制](https://semver.org/)
- Major.Minor.Patch格式
- 详细的变更日志

### PR审查流程
1. 自动化测试通过
2. 代码审查完成
3. 文档更新确认
4. 社区讨论结束

## 📞 联系方式

- **GitHub Issues**: 技术问题和bug报告
- **GitHub Discussions**: 功能讨论和社区交流
- **Email**: macuikit@example.com

## 🏆 贡献者认可

我们感谢所有贡献者的努力，所有贡献者都将在项目中得到认可。

感谢您对MacUIKit的贡献！🎉
