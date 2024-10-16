import SwiftUI
/**
 * Style
 * - Fixme: ⚠️️ We could redesign this to be simpler. Do it later
 */
extension TagItemViewModifier {
   /**
    * Returns the tag item style for the specified selection state
    * - Description: This function determines the style of a tag item based on its selection state. 
    *                It takes a boolean parameter 'selected' and returns the corresponding style. 
    *                If 'selected' is true, it returns the active style, otherwise it returns the inactive style.
    * - Parameter selected: A boolean value indicating whether the tag item is selected or not
    * - Returns: The tag item style for the specified selection state
    * - Remark: The `active` style is returned if the tag item is selected, otherwise the `inActive` style is returned
    */
   static func getStyle(selected: Bool) -> Style {
      selected ? styles.active : styles.inActive // If the tag item is selected, return the active style, otherwise return the inactive style
   }
   /**
    * The default styles for the tag item (active and inactive)
    * - Description: This property holds the default styles for the tag item in both active and inactive states. 
    *                The active style is applied when the tag item is selected, and the inactive style is applied 
    *                when the tag item is not selected.
    * - Note: Find this in the legacy project under: `Pallet.SideBar.highlight`
    * - Fixme: ⚠️️ Use more colors from Pallet etc
    */
   public static let styles: Styles = {
      .init( // Return a tuple containing the active and inactive styles for the tag item
         active: active, // The active style for the tag item
         inActive: inActive // The inactive style for the tag item
      )
   }()
   /**
    * Active
    * - Description: This represents the active style for a tag item. It includes the label color, icon color, 
    *                and background color for a tag item when it is selected.
    */
   fileprivate static let active: Style = {
      let labelColor: Color = {
         #if os(iOS)
         .init(light: .black, dark: .white)
         #elseif os(macOS)
         .init(light: .white, dark: .init(NSColor.selectedMenuItemTextColor))
         #endif
      }()
      let iconColor: Color = {
         let light: Color = .darkGray
         let dark: Color = .white
         return .init(light: light, dark: dark)
      }()
      return .init( // Initializes a new instance of Style for the active tag item
         labelColor: labelColor, // The text color of the active tag item.
         backgroundColor: .clear, // The background color of the active tag item.
         iconColor: iconColor // The color of the icon in the active tag item.
      ) // Define the active style for the tag item, which consists of a label color, background color, and icon color
   }()
   /**
    * inActive
    * - Description: This represents the inactive style for a tag item. It includes the label color, icon color, 
    *                and background color for a tag item when it is not selected.
    */
   fileprivate static let inActive: Style = {
      let labelColor: Color = {
         #if os(macOS)
         return Color(NSColor.secondaryLabelColor)
         #elseif os(iOS)
         return Color(UIColor.secondaryLabel)
         #endif
      }()
      let iconColor: Color = labelColor // Color(light: .primary, dark: .secondary)
     return .init( // Initializes a new instance of Style for the inactive tag item
         labelColor: labelColor,  // The text color of the inactive tag item.
         backgroundColor: .clear, // The background color of the inactive tag item. // .gray.opacity(0.2),
         iconColor: iconColor// The color of the icon in the inactive tag item.
      ) // Define the inactive style for the tag item, which consists of a label color, background color, and icon color
   }()
}
/**
 * A placeholder type alias for a future implementation of the tag item style.
 * - Description: The `Style` struct defines the visual appearance of a tag item within the TagBar, 
 *                including its label color, background color, and icon color when it is in an active state.
 * - Remark: Consider using a struct instead of a type alias for better type safety and encapsulation.
 * - Fixme: ⚠️️ This type alias is a placeholder and should be replaced with a proper implementation.
 * - Fixme: ⚠️️ Maybe use proper button style etc?
 */
extension TagItemViewModifier {
   /**
    * A type alias for the tag item style, which consists of a label color, background color, and icon color.
    * - Description: The `Style` struct encapsulates the visual properties of a tag item, 
    *                defining how it appears within the TagBar. It includes properties for the label color, 
    *                background color, and icon color, which can be customized to represent different states or themes.
    * - Remark: The `labelColor` element specifies the color of the tag item's label.
    * - Remark: The `backgroundColor` element specifies the background color of the tag item.
    * - Remark: The `iconColor` element specifies the color of the tag item's icon.
    */
   internal struct Style {
      let labelColor: Color // The text color of the active tag item.
      let backgroundColor: Color // The background color of the active tag item.
      let iconColor: Color // The color of the icon in the active tag item.
   }
   /**
    * A type alias for the tag item styles, which consists of an active and inactive style.
    * - Description: The `Styles` struct encapsulates the visual properties of a tag item in both active and inactive states. 
    *                It includes properties for the active and inactive styles, which can be customized to represent 
    *                different states of the tag item within the TagBar.
    * - Remark: The `active` element specifies the style of the tag item when it is selected.
    * - Remark: The `inActive` element specifies the style of the tag item when it is not selected.
    */
   internal struct Styles {
      let active: Style // The style for an active tag item.
      let inActive: Style // The style for an inactive tag item.
   }
}
