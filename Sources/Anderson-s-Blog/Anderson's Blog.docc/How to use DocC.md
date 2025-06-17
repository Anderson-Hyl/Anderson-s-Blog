# Using All DocC Directives

Explore a complete demonstration of the available directives in DocC markdown.  
This guide helps you understand layout, media, localization, and tutorial syntax in a single file.

@Metadata {
  @PageKind(sampleCode)
  @CallToAction(purpose: link, url: "https://github.com/apple/swift-docc")
  @PageImage(
    purpose: card,
    source: "docc-overview.png",
    alt: "A colorful diagram showing DocC concepts"
  )
}

## Introduction

DocC is Apple’s documentation compiler. It provides a way to build beautiful, interactive documentation from your Swift packages, frameworks, and tutorials.

@Video(
  poster: "docc-video-poster.png",
  source: "docc-intro-video.mp4",
  alt: "An animated video showing how DocC compiles and presents Swift documentation."
)

---

## 💡 What You’ll Learn

@Row {
  @Column {
    - How to use `@Metadata`, `@PageImage`, and `@CallToAction`
    - Create responsive layouts with `@Row` / `@Column`
    - Embed images and videos with `@Image` / `@Video`
  }

  @Column {
    - Display localized UI examples using `@TabNavigator`
    - Insert callouts like `@Tip`
    - Build tutorials using `@Tutorial` structure
  }
}

---

## 📷 Example Interface

Here’s a look at the UI:

@Image(source: "example-ui.png", alt: "Screenshot of a custom SwiftUI interface")

---

## 🌐 Localized Views

@TabNavigator {
  @Tab("English") {
    ![English UI](localized-en.png)
  }

  @Tab("中文") {
    ![Chinese UI](localized-zh.png)
  }

  @Tab("Español") {
    ![Spanish UI](localized-es.png)
  }
}

---

## 🔁 Tips & Notes

@Tip {
**Did you know?**
After selecting _Product → Build Documentation_, you can preview your `.doccarchive` right in Xcode, and use the _Export_ menu to generate static sites.
}

---

## 📦 Code Sample

You can also embed source code inline:

```swift
struct GreetingView: View {
    var body: some View {
        Text("Hello, DocC!")
            .font(.largeTitle)
            .padding()
    }
}
