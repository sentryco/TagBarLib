import SwiftUI
/**
 * Event
 */
extension TagBarView {
   /**
    * Handles the event when a `TagBar-item` is pressed
    * - Abstract: Animates the highlight view to the specified `TagBarItem` and
    *            sets the selected item to the selected `TagBarItem`
    * - Description: This function is responsible for updating the `TagBarView`'s
    *                state to reflect the user's selection of a tag item. It
    *                triggers an animation that updates the visual state of the
    *                `TagBarView` to highlight the selected tag item and ensures
    *                that the item is visible to the user. It also updates the
    *                `selection` state variable to the index of the pressed tag
    *                item, which can be used by other components to respond to
    *                the change in selection.
    * - Remark: Sets the selected tag item to the one that was pressed
    * - Remark: Animates the highlight view for the pressed tag item
    * - Remark: Animates the scroll view to make the pressed tag item visible
    * - Remark: Notifies callback listeners of the pressed tag item's type
    * - Fixme: ⚠️️ We might be able to make the anim better with: https://sarunw.com/posts/a-first-look-at-matchedgeometryeffect/
    * - Fixme: ⚠️️ We might only need a reference to the tag item and not it's type
    * - Parameter index: index of the item that is pressed
    */
   internal func handleItemPress(index: Int) {
      withAnimation { // Adds anim to list change etc
         selection = index // On tap -> set selectedIndex which is a state
      }
   }
}
