import SwiftUI
// ⚠️️ not in use yet
// fixme: add doc to it
public struct TagBarStyle {
   public var selectedBackgroundColor: Color
   public var unselectedBackgroundColor: Color
   public var selectedTextColor: Color
   public var unselectedTextColor: Color
   
   public static let defaultStyle = TagBarStyle(
      selectedBackgroundColor: Color.accentColor,
      unselectedBackgroundColor: Color.clear,
      selectedTextColor: Color.white,
      unselectedTextColor: Color.primary
   )
}
