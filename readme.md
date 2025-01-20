[![Tests](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/959f5756-05b8-44d5-b7da-8780402fee5a)](https://codebeat.co/projects/github-com-sentryco-tagbarlib-main)

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

## Mindset:
1. TagBar is a customized ScrollView with animated highlight (animates to visible). 
2. It provides a horizontal list of buttons with a selection state that animates on the x-axis. 
3. It uses ScrolView as the base component.

## Features

- Customizable tag types
- Dynamic selection and highlighting of tags
- Horizontal list of buttons
- Has selection state that animates on the x-axis

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

### Swift Package Manager:

```swift
.package(url: "https://github.com/sentryco/TagBarLib.git", branch: "main")
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
