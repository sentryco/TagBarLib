import SwiftUI
/**
 * A view representing a single tag item in the tag bar.
 * - Description: Displays the tag's title and icon, and reflects its selection state.
 *                Handles user interactions such as selection and provides modifiers for customizing its appearance.
 * - Fixme: ⚠️️ Add preview.
 * - Fixme: ⚠️️ Add onPress event handler etc.
 */
struct TagBarItemView: View, Identifiable {
   /**
    * A unique identifier for the tag.
    * - Description: An auto-generated UUID representing the unique identifier for each tag item.
    */
   let id = UUID()
   /**
    * The display title of the tag.
    * - Description: This property holds the title string for the tag item which is displayed in the tag bar.
    */
   let title: String
   /**
    * The URL string for the tag's icon.
    * - Description: This property holds the URL string of the icon associated with the tag item.
    */
   let iconURL: String
   /**
    * Indicates if the tag is selected.
    * - Description: A Boolean value representing whether the tag item is currently selected.
    */
   let isSelected: Bool
   /**
    * The content and behavior of the view.
    * - Description: Defines the view's content and layout.
    *                This view displays the tag's title with appropriate styling and modifiers,
    *                reflecting its selection state.
    */
   var body: some View {
      Text(title) // Button doesn't work with press action out of the box, so we use text and onGesture
         .disabled(true) // We need to be able to tap the background
         .tagItemViewModifier( // Applies the tagItemViewModifier to the Text view.
            isSelected: isSelected, // Determines if the current tag item is selected based on the current selection state.
            iconName: iconURL // Specifies the URL of the icon for the current tag item.
         )
   }
}
