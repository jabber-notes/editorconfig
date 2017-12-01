# EditorConfig学习笔记

[![Build Status](https://travis-ci.org/jnotes/editorconfig.svg?branch=master)](https://travis-ci.org/jnotes/editorconfig)

## 简介

EditorConfig 帮助开发者在不同的编辑器和IDE之间,定义和维护一致的代码风格。EditorConfig项目由用于定义编码风格的文件格式和一组文本编辑器插件组成，这些插件使编辑者能够读取文件格式并遵守定义的样式。 EditorConfig文件易于阅读，并且与版本控制系统很好地配合使用。

## 如何编写`.editorconfig`文件

### `.editorconfig`文件示例

下面是一个`.editorconfig`的文件示例，用于设置Python和JavaScript文件的行尾和缩进样式。

```
# EditorConfig非常棒: http://EditorConfig.org

# 最顶级的EditorConfig文件
root = true

# Unix样式换行
[*]
end_of_line = lf
insert_final_newline = true

# 使用括号扩展符号匹配多个文件
# 设置默认字符集
[*.{js,py}]
charset = utf-8

# 4空格缩进
[*.py]
indent_style = space
indent_size = 4

# 制表符缩进（没有指定大小）
[Makefile]
indent_style = tab

# lib目录下的所有JS的缩进覆盖
[lib/**.js]
indent_style = space
indent_size = 2

# 匹配确切的文件 package.json or .travis.yml
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2
```

使用EditorConfig文件检查Wiki的一些真实的项目示例。

## 这些文件在哪里存储？

当打开一个文件时，EditorConfig插件会在打开的文件的目录和每个父目录中查找名为.editorconfig的文件。 搜索.editorconfig文件将在到达根文件路径或找到具有root = true的EditorConfig文件时停止。

EditorConfig文件从上到下读取，最近读取最近的EditorConfig文件。 来自匹配的EditorConfig部分的属性按照它们被读取的顺序被应用，因此在更接近的文件中的属性优先。

**对于Windows用户**：要在Windows资源管理器中创建.editorconfig文件，您需要创建一个名为.editorconfig.的文件，Windows资源管理器将自动重命名为.editorconfig。

## 文件格式详情

EditorConfig文件使用与Python ConfigParser Library使用的格式兼容的INI格式，但在部分名称中允许使用[和]。 部分名称是文件路径，类似于gitignore接受的格式。 正斜杠（/）用作路径分隔符，八叉形（＃）或分号（;）用于注释。 评论应该按照自己的路线进行。 EditorConfig文件应采用UTF-8编码，使用CRLF或LF行分隔符。

文件路径全局模式和当前支持的EditorConfig属性在下面解释。

通配符模式

在通配符匹配的部分名称中识别的特殊字符：

|通配符|说明|
|---|---|
| *	| 匹配任何字符串，除了路径分隔符 (/) |
| ** | 匹配任何字符串 |
| ?	| 匹配任何单个字符 |
| [name]	| 匹配name中的任何单个字符 |
| [!name]	| 匹配任何不在name中的单个字符 |
| {s1,s2,s3} | 匹配给定的任何字符串（以逗号分隔）（自EditorConfig Core 0.11.0起可用） |
| {num1..num2} | 匹配num1和num2之间的任何整数，其中num1和num2可以是正值或负值|

特殊字符可以用反斜线转义，所以它们不会被解释为通配符模式。

### 支持的属性

请注意，并非所有的属性都由每个插件支持。 维基有一个完整的属性列表。

- indent_style: 设置为`tab`或`space`为缩进方式。
- indent_size: 一个整数，当`indent_style`为`space`时支持，用于设置每个缩进的宽度。 设置为`tab`时，将使用`tab_width`来指定缩进的宽度值。
- tab_width: 一个整数，用于定义用于表示制表符的宽度。 这个默认值是`indent_size`的值，通常不需要指定。
- end_of_line: 设置为`lf`，`cr`或`crlf`来表示换行符的方式。
- charset: 设置为`latin1`，`utf-8`，`utf-8-bom`，`utf-16be`或`utf-16le`来控制字符集。 不鼓励使用`utf-8-bom`。
- trim_trailing_whitespace: 设置为true以删除换行符之前的任何空格字符，并将其设置为false以确保不换行符。
- insert_final_newline: 设置为true以确保文件在保存时以换行符结束，而为了确保文件不是。
- root: 应该在任何部分之外的文件顶部指定的特殊属性。 设置为true以停止.editorconfig文件搜索当前文件。

目前所有的属性和值都是不区分大小写的。 分析时它们是小写的。 通常，如果没有指定属性，将使用编辑器设置，即EditorConfig对该部分不起作用。

这是可以接受的，而且经常会优先保留未指定的某些EditorConfig属性。 例如，除非不同于indent_size的值，否则不需要指定tab_width。 另外，当indent_style设置为tab时，可能希望未指定indent_size，以便读者可以使用其首选缩进宽度来查看文件。 此外，如果项目中的某个属性未标准化（例如end_of_line），最好留空。

对于任何属性，未设置的值是删除该属性的效果，即使之前已经设置。 例如，将indent_size = unset添加到undefine indent_size属性（并使用编辑器默认值）。

## 没有插件必要

这些编辑器与EditorConfig的本地支持捆绑在一起。 一切都正常工作。

[<img src="./images/bbedit.png" width ="180" height="180" alt="BBEdit" align=center />](http://www.baidu.com)
[<img src="./images/gnome-builder.png" width ="180" height="180" alt="GNome" align=center />](http://www.baidu.com)
[<img src="./images/github.png" width ="180" height="180" alt="GitHub" align=center />](http://www.baidu.com)
[<img src="./images/gogs.png" width ="180" height="180" alt="Gogs" align=center />](http://www.baidu.com)
[<img src="./images/intellijIDEA.png" width ="180" height="180" alt="intellijIDEA" align=center />](http://www.baidu.com)
[<img src="./images/komodo.png" width ="180" height="180" alt="komodo" align=center />](http://www.baidu.com)
[<img src="./images/pyCharm.png" width ="180" height="180" alt="pyCharm" align=center />](http://www.baidu.com)
[<img src="./images/rubyMine.png" width ="180" height="180" alt="rubyMine" align=center />](http://www.baidu.com)
[<img src="./images/sourcelair.png" width ="180" height="180" alt="sourcelair" align=center />](http://www.baidu.com)
[<img src="./images/TortoiseGit.png" width ="180" height="180" alt="TortoiseGit" align=center />](http://www.baidu.com)
[<img src="./images/visualstudio-pro.png" width ="180" height="180" alt="visualstudio-pro" align=center />](http://www.baidu.com)
[<img src="./images/webStorm.png" width ="180" height="180" alt="webStorm" align=center />](http://www.baidu.com)

## 下载插件

要使用下列的编辑器，您将需要安装一个插件。

[<img src="./images/appCode.png" width ="180" height="180" alt="appCode" align=center />](http://www.baidu.com)
[<img src="./images/atom.png" width ="180" height="180" alt="atom" align=center />](http://www.baidu.com)
[<img src="./images/brackets.png" width ="180" height="180" alt="brackets" align=center />](http://www.baidu.com)
[<img src="./images/clion.png" width ="180" height="180" alt="clion" align=center />](http://www.baidu.com)
[<img src="./images/coda.png" width ="180" height="180" alt="coda" align=center />](http://www.baidu.com)
[<img src="./images/codeblocks.png" width ="180" height="180" alt="codeblocks" align=center />](http://www.baidu.com)
[<img src="./images/eclipse.png" width ="180" height="180" alt="eclipse" align=center />](http://www.baidu.com)
[<img src="./images/emacs.png" width ="180" height="180" alt="emacs" align=center />](http://www.baidu.com)
[<img src="./images/geany.png" width ="180" height="180" alt="geany" align=center />](http://www.baidu.com)
[<img src="./images/gedit.png" width ="180" height="180" alt="gedit" align=center />](http://www.baidu.com)
[<img src="./images/jedit.png" width ="180" height="180" alt="jedit" align=center />](http://www.baidu.com)
[<img src="./images/micro.png" width ="180" height="180" alt="micro" align=center />](http://www.baidu.com)
[<img src="./images/NetBeans.png" width ="180" height="180" alt="NetBeans" align=center />](http://www.baidu.com)
[<img src="./images/notepad.png" width ="180" height="180" alt="notepad" align=center />](http://www.baidu.com)
[<img src="./images/phpStorm.png" width ="180" height="180" alt="phpStorm" align=center />](http://www.baidu.com)
[<img src="./images/sublimetext.png" width ="180" height="180" alt="sublimetext" align=center />](http://www.baidu.com)
[<img src="./images/textadept.png" width ="180" height="180" alt="textadept" align=center />](http://www.baidu.com)
[<img src="./images/textmate.png" width ="180" height="180" alt="textmate" align=center />](http://www.baidu.com)
[<img src="./images/vim.png" width ="180" height="180" alt="vim" align=center />](http://www.baidu.com)
[<img src="./images/visualstudio-code.png" width ="180" height="180" alt="visualstudio-code" align=center />](http://www.baidu.com)
[<img src="./images/xcode.png" width ="180" height="180" alt="xcode" align=center />](http://www.baidu.com)

## 贡献给EditorConfig

### 给我们您的反馈

这个项目非常需要其他开发者的反馈。 我们希望听到关于如何使这个项目更好的想法。 请使用邮件列表向EditorConfig团队发送电子邮件（通过发送电子邮件到editorconfig+subscribe@googlegroups.com订阅），并使用问题跟踪器提交错误（但请首先查看FAQ）。 也可以随时向我们发送推文。

### 创建一个插件

EditorConfig插件可以使用其中一个EditorConfig核心库来开发。 EditorConfig核心库接受正在编辑的文件的输入，查找和解析相关的.editorconfig文件，并返回应该使用的属性。 为了将来的兼容性，请忽略编辑器插件中的所有无法识别的属性和属性值，因为将来会添加新的属性和允许的值。 目前有C库，Python库，JavaScript库，Java库，lua库，.NET库和Ruby库。

如果您打算创建一个新的插件，请使用邮件列表让我们知道，这样我们就可以帮助您创建插件。 如果您打算将EditorConfig内核之一用作库或命令行界面，则C库文档，Python库文档或Java库文档可能会有帮助。

更多详细信息可以在“插件 - 如何做”wiki页面上找到。

## 主要贡献者

### 核心类库:

- EditorConfig C Core: Hong Xu and Trey Hunner
- EditorConfig Java Core: Dennis Ushakov
- EditorConfig Javascript Core: Trey Hunner and Jed Mao
- EditorConfig Python Core: Trey Hunner
- EditorConfig .NET Core: Martijn Laarman
- EditorConfig Ruby Core: Joshua Peek and Brian Lopez

### 编辑器插件:

- Atom plugin: Sindre Sorhus
- Brackets plugin: Chen-Heng Chang
- Code::Blocks plugin: Hong Xu
- Emacs plugin: Trey Hunner, Johan Sundström, 10sr
- Geany plugin: Hong Xu
- Gedit plugin: Trey Hunner
- GitHub Browser extension: Ingvar Stepanyan
- JetBrain plugin: Kevin Bell, Dennis Ushakov
- jEdit plugin: Hong Xu
- Micro plugin: 10sr
- NetBeans plugin: Benny Neugebauer, Michael Koppen, Junichi Yamamoto
- Notepad++ plugin: Hong Xu
- Sublime Text plugin: Sindre Sorhus
- TextMate plugin: Rob Brackett
- Vim plugin: Hong Xu, Trey Hunner
- Visual Studio plugin: William Swanson, nulltoken, Martijn Laarman, Arkadiy Shapkin, Chris Dias (for VS Code)
- Xcode plugin: Marco Sero

由Kat On和Amon Keishima绘制的EditorConfig徽标。请适当说明。
