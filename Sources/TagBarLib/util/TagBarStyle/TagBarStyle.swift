import SwiftUI
// ⚠️️ not in use yet
    /**
     * `TagBarStyle` defines the visual styling for a Tag Bar component, including colors for selected and unselected states.
     *
     * - Properties:
     *   - `selectedBackgroundColor`: The background color applied to a tag when it is selected.
     *   - `unselectedBackgroundColor`: The background color applied to a tag when it is not selected.
     *   - `selectedTextColor`: The text color of a tag when it is selected.
     *   - `unselectedTextColor`: The text color of a tag when it is not selected.
     */
    public struct TagBarStyle {
       /// The background color when a tag is selected.
       public var selectedBackgroundColor: Color
       
       /// The background color when a tag is unselected.
       public var unselectedBackgroundColor: Color
       
       /// The text color when a tag is selected.
       public var selectedTextColor: Color
       
       /// The text color when a tag is unselected.
       public var unselectedTextColor: Color
       
       /**
        * The default style for `TagBarStyle`.
        *
        * - Parameters:
        *   - `selectedBackgroundColor`: Defaults to `Color.accentColor`.
        *   - `unselectedBackgroundColor`: Defaults to `Color.clear`.
        *   - `selectedTextColor`: Defaults to `Color.white`.
        *   - `unselectedTextColor`: Defaults to `Color.primary`.
        */
       public static let defaultStyle = TagBarStyle(
          selectedBackgroundColor: Color.accentColor,
          unselectedBackgroundColor: Color.clear,
          selectedTextColor: Color.white,
          unselectedTextColor: Color.primary
       )
    }
