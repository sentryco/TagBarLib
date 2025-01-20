import SwiftUI
/**
 * Represents an item in the `TagBar`
 * - Description: A modifier that applies a specific style to a TagBarItem in the TagBar. 
 *                This includes setting the icon color, font color, icon name, padding, and background color.
 * - Remark: Has icon and label and active / in-active state
 * - Note: The reason we don't make tag-item-view as a button, is because we need to use gesture on down events, but could be Worth an exploration later if its possible to use Button. will require some lengthy effort probably
 * - Fixme: ⚠️️ Remove style etc? just use modifier etc, store style in a custom modifier etc? still relevant?
 * - Fixme: ⚠️️ Maybe animate icon selection state? 0.2 quick transition?
 */
internal struct TagItemViewModifier: ViewModifier {
   /**
    * The icon color of the tag item.
    */
   fileprivate let iconColor: Color
   /**
    * The font color of the tag item.
    */
   fileprivate let fontColor: Color
   /**
    * The icon name of the tag item.
    */
   fileprivate let iconName: String
   /**
    * Horizontal padding
    */
   fileprivate let padding: EdgeInsets
   /**
    * The background color of the tag item.
    */
   fileprivate let backgroundColor: Color
   /**
    * Applies the tag item view modifier to a content view, configuring its appearance and layout.
    * - Parameter content: The content view to which the tag item view modifier is applied.
    * - Returns: A view with the tag item view modifier applied.
    */
   internal func body(content: Content) -> some View {
      HStack { // Button has down state etc. so not easy to use out of the box, could probably be used if research is done etc
         iconView
         content // Set the text color of the tag item's label to the label color specified by the style
            .foregroundColor(fontColor)
            // - Fixme: ⚠️️ Add UIFont.label ?
            .font(Font.body) // Set the font of the label to the system label font
      }
      .padding(padding)
      .background(backgroundColor) // Set the background color of the tag item to the background color specified by the style
   }
}
/**
 * Content
 */
extension TagItemViewModifier {
   /**
    * Create icon-view
    * - Abstract: This function creates a view for the icon of the tag item.
    * - Description: This function generates a view for the icon of the tag item. It applies the header icon 
    *                view-modifier to an empty view, setting the icon name, padding, icon color, background color, 
    *                and stroke color according to the style specified for the tag item.
    * - Returns: A view that represents the icon of the tag item.
    * - Fixme: ⚠️️ use .clear instead?
    */
   fileprivate var iconView: some View {
      EmptyView() // Set the foreground color of the tag item's icon to the icon color specified by the style
         .headerIconViewModifier( // Apply the header icon view modifier to the empty view
            iconName: iconName, // Set the icon name of the header icon view modifier to the icon name specified by the style
            padding: .zero, // Set the padding of the header icon view modifier to 0
            iconColor: iconColor, // Set the icon color of the header icon view modifier to the icon color specified by the style
            backgroundColor: Color.white.opacity(0.0), // Set the background color of the header icon view modifier to white with 0% opacity
            strokeColor: Color.gray.opacity(0.0) // Set the stroke color of the header icon view modifier to gray with 0% opacity
         )
   }
}
/**
 * Convenient
 */
extension View {
   /**
    * Applies the tag item view modifier to a view, configuring its appearance and layout based on the selection state and icon name.
    * - Description: This function applies a tag item view modifier to a view, 
    *                adjusting its appearance and layout based on the selection state and icon name. 
    *                If the tag item is selected, it will be styled differently to indicate its active state. 
    *                The icon name parameter determines the specific icon to be displayed within the tag item.
    * - Parameters:
    *   - isSelected: A boolean indicating whether the tag item is selected or not. This affects the visual styling of the tag item.
    *   - iconName: The name of the icon to be displayed within the tag item.
    * - Returns: A view with the tag item view modifier applied, incorporating the specified selection state and icon name.
    */
   internal func tagItemViewModifier(isSelected: Bool, iconName: String) -> some View {
      let style: TagItemViewModifier.Style = { // Get the style for the tag item based on whether it is selected or not
         // Retrieves the style for the tag item based on its selection state
         TagItemViewModifier.getStyle(
            selected: isSelected // Set the selected state of the tag item view modifier to the value of the isSelected parameter
         )
      }()
      let modifier = TagItemViewModifier( // Initializes a new instance of TagItemViewModifier
         iconColor: style.iconColor, // Sets the icon color based on the style
         fontColor: style.labelColor, // Sets the font color based on the style
         iconName: iconName, // Sets the icon name based on the input parameter
         padding: TagItemViewModifier.padding, // Sets the padding based on the static padding value of TagItemViewModifier
         backgroundColor: style.backgroundColor // Sets the background color based on the style
      )
      return self.modifier(modifier)
   }
}
