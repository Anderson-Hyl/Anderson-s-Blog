# SwiftUI 中配置富文本

这篇简短的文章中，我们将看到如何使用 `SwiftUI` 为 `Text` 中的部分文字设置不同的颜色，字体，字重等等

## 为部分文本指定各种效果

`SwiftUI` 中的 `Text` 是值类型，支持以拼接的方式构建不同的效果。

### 示例

```swift
public struct TextStyling: View {
	public var body: some View {
		(
			Text("Play smarter with ").font(.title2).foregroundStyle(.primary) +
			Text("Subscription").font(.title).foregroundStyle(.blue.gradient)
		)
		.padding()
	}
}
```

### 运行效果
@Image(source: textStyling.png, alt: "运行效果")

