# EditorConfig学习笔记

[![Build Status](https://travis-ci.org/jnotes/editorconfig.svg?branch=master)](https://travis-ci.org/jnotes/editorconfig)

## 简介

EditorConfig helps developers define and maintain consistent coding styles between different editors and IDEs. The EditorConfig project consists of a file format for defining coding styles and a collection of text editor plugins that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.

## 如何编写`.editorconfig`文件

### `.editorconfig`文件示例

Below is an example .editorconfig file setting end-of-line and indentation styles for Python and JavaScript files.

```
# EditorConfig is awesome: http://EditorConfig.org

# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

# Matches multiple files with brace expansion notation
# Set default charset
[*.{js,py}]
charset = utf-8

# 4 space indentation
[*.py]
indent_style = space
indent_size = 4

# Tab indentation (no size specified)
[Makefile]
indent_style = tab

# Indentation override for all JS under lib directory
[lib/**.js]
indent_style = space
indent_size = 2

# Matches the exact files either package.json or .travis.yml
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2
```

Check the Wiki for some real-world examples of projects using EditorConfig files.

## Where are these files stored?

When opening a file, EditorConfig plugins look for a file named .editorconfig in the directory of the opened file and in every parent directory. A search for .editorconfig files will stop if the root filepath is reached or an EditorConfig file with root=true is found.

EditorConfig files are read top to bottom and the closest EditorConfig files are read last. Properties from matching EditorConfig sections are applied in the order they were read, so properties in closer files take precedence.

** For Windows Users ** : To create an .editorconfig file within Windows Explorer, you need to create a file named .editorconfig., which Windows Explorer will automatically rename to .editorconfig.

## File Format Details

EditorConfig files use an INI format that is compatible with the format used by Python ConfigParser Library, but [ and ] are allowed in the section names. The section names are filepath globs, similar to the format accepted by gitignore. Forward slashes (/) are used as path separators and octothorpes (#) or semicolons (;) are used for comments. Comments should go on their own lines. EditorConfig files should be UTF-8 encoded, with either CRLF or LF line separators.

Filepath glob patterns and currently-supported EditorConfig properties are explained below.

Wildcard Patterns

Special characters recognized in section names for wildcard matching:

|通配符|说明|
|---|---|
| *	| Matches any string of characters, except path separators (/) |
| ** | Matches any string of characters |
| ?	| Matches any single character |
| [name]	| Matches any single character in name |
| [!name]	| Matches any single character not in name |
| {s1,s2,s3} | Matches any of the strings given (separated by commas) (Available since EditorConfig Core 0.11.0) |
| {num1..num2} | Matches any integer numbers between num1 and num2, where num1 and num2 can be either positive or negative|

Special characters can be escaped with a backslash so they won't be interpreted as wildcard patterns.

Supported Properties

Note that not all properties are supported by every plugin. The wiki has a complete list of properties.

- indent_style: set to tab or space to use hard tabs or soft tabs respectively.
- indent_size: a whole number defining the number of columns used for each indentation level and the width of soft tabs (when supported). When set to tab, the value of tab_width (if specified) will be used.
- tab_width: a whole number defining the number of columns used to represent a tab character. This defaults to the value of indent_size and doesn't usually need to be specified.
- end_of_line: set to lf, cr, or crlf to control how line breaks are represented.
- charset: set to latin1, utf-8, utf-8-bom, utf-16be or utf-16le to control the character set. Use of utf-8-bom is discouraged.
- trim_trailing_whitespace: set to true to remove any whitespace characters preceding newline characters and false to ensure it doesn't.
- insert_final_newline: set to true to ensure file ends with a newline when saving and false to ensure it doesn't.
- root: special property that should be specified at the top of the file outside of any sections. Set to true to stop .editorconfig files search on current file.

Currently all properties and values are case-insensitive. They are lowercased when parsed. Generally, if a property is not specified, the editor settings will be used, i.e. EditorConfig takes no effect on that part.

It is acceptable and often preferred to leave certain EditorConfig properties unspecified. For example, tab_width need not be specified unless it differs from the value of indent_size. Also, when indent_style is set to tab, it may be desirable to leave indent_size unspecified so readers may view the file using their preferred indentation width. Additionally, if a property is not standardized in your project (end_of_line for example), it may be best to leave it blank.

For any property, a value of unset is to remove the effect of that property, even if it has been set before. For example, add indent_size = unset to undefine indent_size property (and use editor default).

## No Plugin Necessary

These editors come bundled with native support for EditorConfig. Everything should just work.

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

To use EditorConfig with one of these editors, you will need to install a plugin.

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

## Contributing to EditorConfig

### Give us your feedback

This project is greatly in need of feedback from other developers. We want to hear ideas about how to make this project better. Please use the mailing list to send an email to the EditorConfig team (subscribe by shooting an email to editorconfig+subscribe@googlegroups.com) and use the issue tracker to submit bugs (but please take a look at the FAQ first). Also feel free to tweet at us.

### Create a plugin

EditorConfig plugins can be developed by using one of the EditorConfig core libraries. The EditorConfig core libraries accept as input the file being edited, find and parse relevant .editorconfig files, and pass back the properties that should be used. Please ignore any unrecognized properties and property values in your editor plugin for future compatibility, since new properties and permitted values will be added in the future. Currently there is a C library, a Python library, a JavaScript library, a Java library, a lua library, a .NET library, and a Ruby library.

If you are planning on creating a new plugin, use the mailing list to let us know so we can help out and link to your plugin once it's created. If you plan on using one of the EditorConfig cores as a library or command line interface, the C library documentation, Python library documentation or Java library documentation may be helpful.

More details can be found on the Plugin-How-To wiki page.

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

EditorConfig logos drawn by Kat On and Amon Keishima. Website by Trey Hunner and Hong Xu. Please attribute appropriately.
