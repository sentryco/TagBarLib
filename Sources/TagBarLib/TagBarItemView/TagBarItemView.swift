import SwiftUI
/**
 * A view representing an individual tag item within a tag bar.
 *
 * Displays the title and icon associated with the tag and visualizes its selection state.
 */
// fixme: add preview
// fixme: add onPress event handler etc
struct TagBarItemView: View, Identifiable {
   /// A view representing a single tag item in the tag bar.
   ///
   /// Displays the tag's title and icon, and reflects its selection state.
   /// Handles user interactions such as selection and provides modifiers for customizing its appearance.
   let id = UUID()
   let title: String
   let iconURL: String
   let isSelected: Bool
   /// Represents an individual tag item in the tag bar.
   ///
   /// - Properties:
   ///   - id: A unique identifier for the tag.
   ///   - title: The display title of the tag.
   ///   - iconURL: The URL string for the tag's icon.
   ///   - isSelected: A Boolean indicating if the tag is selected.
   var body: some View {
      Text(title) // Button doesn't work with press action out of the box, so we use text and onGesture
         .disabled(true) // We need to be able to tap the background
         .tagItemViewModifier( // Applies the tagItemViewModifier to the Text view.
            isSelected: isSelected, // Determines if the current tag item is selected based on the current selection state.
            iconName: iconURL // Specifies the URL of the icon for the current tag item.
         )
   }
}
