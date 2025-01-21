[![Tests](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/959f5756-05b8-44d5-b7da-8780402fee5a)](https://codebeat.co/projects/github-com-sentryco-tagbarlib-main)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS-000000.svg?logo=apple&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-F05138.svg?logo=swift&logoColor=white)](https://swift.org)

# TagBarLib

> Horizontal TagBar for iOS

<img src="https://s1.gifyu.com/images/SBHlN.gif" width="291px" alt="TagBarLib Demo">

## Description

TagBarLib is a Swift package that provides a customizable Tag Bar view for iOS

## Table of Contents
- [Mindset](#mindset)
- [Features](#features)
- [Usage](#usage)
- [Todo](#todo)

## Problem

- Apple's native horizontal scrollable tag bar does not have an **animated background highlight**.
- Apple's native horizontal scrollable tag bar does not **move into view** when a button that is slightly out of view is tapped.
- Apple's native horizontal scrollable tag bar does not have APIs to **move focus to the beginning or end**.

## Solution

1. **TagBar** is a customized `ScrollView` with an animated highlight that ensures the selected item is visible.
2. It provides a horizontal list of buttons with a selection state that animates along the x-axis.
3. It uses `ScrollView` as the base component.

## Features

- **Customizable Tags**: Define your own tags with titles and icons.
- **Animated Highlighting**: Smooth animations when selecting tags.
- **Horizontal Scrolling**: Tags are displayed in a horizontally scrollable view.
- **Selection State Management**: Easily manage which tag is selected.
- **Accessibility Support**: Fully supports VoiceOver and dynamic type.

## Usage

```swift
import SwiftUI
import TagBarLib

struct ContentView: View {
   @State private var selectedTag = 0
   let tags = [
      TagBarItem(title: "Home", iconURL: "house"),
      TagBarItem(title: "Search", iconURL: "magnifyingglass"),
      TagBarItem(title: "Profile", iconURL: "person.circle")
   ]
   var body: some View {
      VStack {
         TagBarView(
            tagTypes: tags,
            selection: $selectedTag
         )
         // Rest of your view goes here
      }
   }
}
```

> **Note**
> You can apply your own font or text color by using a `ViewModifier`. Apply it to `TagBarView`.

### Swift Package Manager:

```swift
.package(url: "https://github.com/sentryco/TagBarLib", branch: "main")
```

### Todo:
- Add example to readme
- Add xCode proj, with the TagBarTest code 👈 (import the package via url, see splitview repo regarding this)
- Add dedicated UITests later 👈 see main uitests for how to do it etc
- Testing and Dependency Management (Expand Testing: The test suite appears minimal and could be expanded to cover more functionality, ensuring stability as the library evolves.)
- Try refactoring TagBarView+Content.swift with copilot / cursor
- Code Simplification and Documentation
- Enhancements in Preview and Debugging Support
- Improve dynamic type sizes. relative font sizes etc
- Refactoring and Code Simplification - TagBarView+Content.swift: The code in this file appears complex and could benefit from refactoring for better readability and maintainability. Consider simplifying the methods and possibly breaking down complex views into smaller, more manageable components.
- Add ways to inject size, style, accessID. Potentially as struct or typealias
- Remove Unit-test
- Add problem / solution to readme
- Allow users to customize the appearance of `TagBarView` more extensively by introducing a `TagBarStyle` configuration.

```swift:Sources/TagBarLib/TagBarStyle.swift
import SwiftUI

public struct TagBarStyle {
      public var selectedBackgroundColor: Color
      public var unselectedBackgroundColor: Color
      public var selectedTextColor: Color
      public var unselectedTextColor: Color
      public var highlightCornerRadius: CGFloat

      public static let defaultStyle = TagBarStyle(
         selectedBackgroundColor: .accentColor,
         unselectedBackgroundColor: .clear,
         selectedTextColor: .white,
         unselectedTextColor: .primary,
         highlightCornerRadius: 8
      )
}
public struct TagBarView: View {
       // Existing properties...
       public var style: TagBarStyle

       public init(tagTypes: [TagTypeKind], selection: Binding<Int>, style: TagBarStyle = .defaultStyle) {
           self.tagTypes = tagTypes
           self._selection = selection
           self.style = style
       }
   }
```