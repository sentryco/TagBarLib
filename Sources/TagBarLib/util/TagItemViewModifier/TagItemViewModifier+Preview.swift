import SwiftUI
/**
 * Preview (This preview isnt that useful)
 * - Description: This preview showcases the usage of the `TagItemViewModifier` on a `Text` view. It demonstrates how the modifier changes the appearance of the text based on the `isSelected` state and the specified icon name.
 * - Fixme: ⚠️️ Add darkmode, add blackwhite bg
 */
#Preview {
   /**
    * Preview closure for TagItemViewModifier.
    * - Description: This closure generates a preview for the TagItemViewModifier based on the isSelected state.
    * - Parameter isSelected: A boolean indicating whether the tag item is selected or not.
    * - Returns: A view with the `TagItemViewModifier` applied, incorporating the specified selection state.
    */
   let closure: (_ isSelected: Bool) -> some View = { isSelected in
      Text("Test")
         .tagItemViewModifier( // Apply the tag item view modifier to the text
            isSelected: isSelected, // Passes the isSelected state to the tagItemViewModifier
            iconName: "heart" // Sets the icon name to "heart"
         )
         .padding(16) // Applies padding of 16 to all sides of the view
         .frame(maxWidth: .infinity) // Sets the maximum width of the view to infinity, making it span the available width
         .background(Color.gray.opacity(0.2)) // Sets the background color of the view to gray
   }
   return closure(true)
}
