import SwiftUI
/**
 * Extension to TagBarView to provide getter methods for selected tag items.
 */
extension TagBarView {
   /**
    * Returns the title string of the currently selected `TagBarItem`
    * - Description: This method retrieves the title string of the currently
    *                selected `TagBarItem`. If no item is selected or the
    *                selection index is out of bounds, it returns `nil`.
    * - Note: Returns `nil` if no item is selected
    * - Returns: An optional `String` containing the title of the selected `TagBarItem`, or `nil` if no item is selected.
    * - Fixme: ⚠️️ use safe: array call ? add safe extension to package etc?
    */
   public var getSelectedTagItemTitleStr: String? {
      // Make sure selection is within count
      guard selection < self.tagTypes.count else { return nil }
      // Cast the selected item to TagItemView and return it's title string
      return self.tagTypes[selection].title
   }
}
