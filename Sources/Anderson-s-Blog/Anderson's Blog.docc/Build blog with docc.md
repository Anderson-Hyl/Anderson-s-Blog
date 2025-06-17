
# 用 DocC 创建个人博客并部署到 GitHub Pages

Apple 的文档工具 DocC 不仅可以为 Swift 项目生成精美的文档，其强大的静态网站生成能力也让它成为搭建个人博客的理想选择。它能将 Markdown 文件和 Swift 代码注释转换成结构清晰、界面优雅的静态网页。
本篇文章将带你一步步使用 DocC，从零开始搭建一个以 Swift Package 为基础的博客网站，并将其免费部署到 GitHub Pages 上。

@Metadata {
	@PageKind(article)
	@PageImage(purpose: card, source: "swift-docc", alt: "image")
}



@Row {
	@Column {
		## 为什么用 DocC 做博客？
		
		- 官方支持，风格统一：与 Apple 官方文档风格一致，简洁、专业。
		- Markdown 驱动：使用你最熟悉的 Markdown 语法撰写文章。
		- 集成 Swift Playground：可以在文章中嵌入可交互的 Swift 代码示例。
		- 静态网站：生成速度快，安全性高，易于托管。
		- 自动化部署：可以轻松集成 GitHub Actions，实现自动化构建和发布。
	}
	@Column {
		@Image(source: blog-preview.png, alt: "最终胜出的 DocC 博客页面截图") 
	}
}


## Step 1: 创建 **Swift Package** 项目

首先，我们需要一个 **Swift Package** 项目作为博客内容的载体。你可以通过 `Xcode` 或者命令行来创建。

- 打开你的终端

- 创建一个新的项目文件夹并进入该目录:

```bash
mkdir MyBlog
cd MyBlog
```

- 创建一个新的 **Swift Package** 

```bash
swift package init --type library
```

现在，你的 `MyBlog` 文件夹就是一个标准的 **Swift Pacakge** 项目了。我们所有的博客文章和配置都将存放在这里。

## Step 2: 添加 DocC 支持

为了让 DocC 能够识别和构建我们的博客，需要为其创建一个专门的文档目录（DocC Catalog)。

- 在项目的 `Sources/MyBlog/` 目录下，创建一个以 `.docc` 结尾的文件夹。这个文件夹就是 DocC 的文档目录。

- 在 `MyBlog.docc` 目录中创建你的第一篇 Markdown 文章。例如，我们创建一个 `Welcome.md` 文件。

- 用你喜欢的文本编辑器打开 `Welcome.md`，并写入一些内容

## Step 3: 在 Xcode 中生成并预览

在正式部署之前，我们可以利用 Xcode 强大的文档构建功能在本地预览效果。

- 使用 `Xcode` 打开项目根目录下的 `Package.swift` 文件。

- 确保 `Xcode` 顶部的 `Scheme` 已经选中了 `MyBlog`。

- 点击菜单栏的 `Product → Build Documentation` (快捷键: `⌃⇧⌘D`)。


Xcode 会开始编译项目并处理 .docc 目录中的所有内容。完成后，文档预览窗口将自动弹出，你就可以看到渲染后的博客页面了。

## Step 4: 导出为静态网站

当你在本地预览对效果感到满意后，就可以将它导出为一套标准的静态文件（HTML, CSS, JS），以便上传到任何静态网站托管服务。

- 找到构建产物：`Xcode` 生成的文档包以 `.doccarchive` 结尾，通常位于一个名为 `DerivedData` 的深层目录中。你可以用以下命令快速找到它：

ips: 在 `Product → Build Documentation` 环节后，Xcode 会跳转到 `Documentation` 窗口，你可以看到刚编译完毕的 `.doccarchive` 文档，辅助点击可以导出到任意你希望的位置。-->

- 转换文档包：使用 `xcrun docc` 命令行工具将文档包转换为可用于部署的静态文件。

```bash
$(xcrun --find docc) process-archive transform-for-static-hosting \
<path-to-your-doccarchive> \
--output-path docs \
--hosting-base-path MyBlog
```
	`--output-path docs`：指定输出文件夹为 docs。这是 GitHub Pages 默认的发布目录之一，非常方便。

	`--hosting-base-path MyBlog`：指定网站的根路径。如果你的 GitHub Pages 地址是 `https://your-username.github.io/MyBlog/`，那么这里就应该填写你的仓库名 MyBlog。

执行完毕后，项目根目录下会生成一个 `docs` 文件夹，里面包含了完整的静态网站文件。

## Step 5: 配置 `Github Pages` 并部署

最后一步，就是将我们的劳动成果发布到互联网上。

a. 将你的整个 `MyBlog` 项目（确保已包含 `docs` 文件夹）推送到 `GitHub` 仓库。

b. 在你的 GitHub 仓库页面，点击 `Settings (设置) → Pages` (页面)。

c. 在 `Build and deployment` (构建和部署) 部分，进行如下配置：
	
	- Source (源): 选择 Deploy from a branch (从分支部署)

	- 文件夹选择 `/(root)` 旁边的下拉菜单，然后选择 `/docs`

	- 点击 Save (保存)

d. 设置首页重定向 (重要！):

DocC 生成的网站首页路径位于 `docs/documentation/myblog/`。为了让访问者直接通过 `https://your-username.github.io/MyBlog/` 就能看到主页，我们需要修改在 `docs` 根目录下的 `index.html` 文件来重定向。

```html
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="refresh" content="0; url=documentation/myblog/" />
	</head>
	<body>
		<p>Redirecting to the blog...</p>
	</body>
</html>
```

e. 将新增的 `docs/index.html` 文件提交并推送到 GitHub。

稍作等待，让 GitHub Pages 完成构建和部署。之后，你就可以通过 `https://<你的GitHub用户名>.github.io/MyBlog/` 来访问你的全新博客了！

## 结论

恭喜！你已经成功使用 DocC 构建并部署了一个属于自己的技术博客。
