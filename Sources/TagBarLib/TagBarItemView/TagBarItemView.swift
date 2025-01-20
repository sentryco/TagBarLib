import SwiftUI
// fixme: add doc
struct TagBarItemView: View, Identifiable {
   // fixme: add doc
   let id = UUID()
   let title: String
   let iconURL: String
   let isSelected: Bool
   // fixme: add doc
   var body: some View {
      Text(title) // Button doesn't work with press action out of the box, so we use text and onGesture
         .disabled(true) // We need to be able to tap the background
         .tagItemViewModifier( // Applies the tagItemViewModifier to the Text view.
            isSelected: isSelected, // Determines if the current tag item is selected based on the current selection state.
            iconName: iconURL // Specifies the URL of the icon for the current tag item.
         )
   }
}
