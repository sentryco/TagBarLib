import SwiftUI
/**
 * Setter
 */
extension TagBarView {
   /**
    * Sets the selected `TagBarItem` based on its title string
    * - Description: This method searches for a `TagBarItem` by its title and
    *                updates the `selection` state to the index of the found item,
    *                effectively selecting it within the `TagBarView`. If the item
    *                with the given title does not exist, the selection is not
    *                changed.
    * - Parameter title: The title string of the `TagBarItem` to select
    */
   public func setSelected(title: String) {
      // Find the index of the `TagBarItem` with the given title string
      guard let idx: Int = self.tagTypes.firstIndex (where: { $0.title == title }) else { return }
      // Select the `TagBarItem` at the found index
      setSelected(idx: idx)
   }
   /**
    * Sets the selected `TagBarItem` based on its index in the `stackView`
    * - Description: This method sets the selected `TagBarItem` based on its
    *                index in the `tagTypes` array. It ensures the index is
    *                within the bounds of the array and then updates the
    *                `selection` state to the provided index, effectively
    *                selecting the corresponding `TagBarItem` within the
    *                `TagBarView`.
    * - Parameter idx: The index of the `TagBarItem` to select
    */
   public func setSelected(idx: Int) {
      // Make sure the index is within the bounds of the `stackView` arranged subviews
      guard idx < self.tagTypes.count else { return }
      // Select the `TagBarItem` if it is not already selected
      selection = idx // Set the highlight view to the selected `TagBarItem`
   }
}
