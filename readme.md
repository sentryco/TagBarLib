[![Tests](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/TagBarLib/actions/workflows/Tests.yml)

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
import TagBarLib

// Initialize the tag bar view with your tag types and a binding to the selected tag
let tagBarView = TagBarView(tagTypes: [.red, .blue, .green], selection: $selectedTag)
```

## Debug code snippet

If there is UITest issues etc. Try to find the issue with this simpler example snippet:
```swift
import SwiftUI

struct DummyBarView: View {
   @Binding var selectedIndex: Int
   enum TagType: String, CaseIterable { case one, two, three, four, five, six, seven }
   var tagTypes: [String] { TagType.allCases.map { $0.rawValue } }
   var body: some View {
      ScrollViewReader { (_ reader: ScrollViewProxy) in // We could use this, see for code: https://developer.apple.com/documentation/swiftui/scrollviewreader
         ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
               ForEach(Array(tagTypes.indices), id: \.self) { i in
                  rowItem(i: i)
               }
            }
         }
      }
   }
   func rowItem(i: Int) -> some View {
      let title = tagTypes[i]
      return Text(title)
         .disabled(true)
         .accessibilityIdentifier(title)
         .padding()
         .background(selectedIndex == i ? .green : .gray)
         .onTapGesture {
            selectedIndex = i
         }
   }
}
#Preview {
   struct DummyContainer: View {
      @State var selectedIndex: Int = 0
      var body: some View {
         DummyBarView(selectedIndex: $selectedIndex)
      }
   }
   return DummyContainer()
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