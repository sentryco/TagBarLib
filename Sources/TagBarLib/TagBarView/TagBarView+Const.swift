import Foundation
/**
 * Constants used by the TagBarView component.
 * - Fixme: ⚠️️ We could add inner and outer margins as consts
 */
extension TagBarView {
   /**
    * The coordinate space identifier for the scroll view in the TagBarView component.
    * - Description: This constant defines the coordinate space identifier
    *                for the scroll view within the TagBarView component. It is used to
    *                establish a named coordinate space that allows for precise tracking
    *                of the view's offset within the scrollable area. This is particularly
    *                useful for implementing custom scroll behaviors, such as tracking the
    *                scroll position or applying layout modifications based on the scroll
    *                offset.
    */
   static let coordinateSpace: String = "scrollview"
   /**
    * The namespace identifier for the horizontal stack view in the `TagBarView` component is used to identify and manage the layout of the horizontal stack view within the `TagBarView`. This identifier is crucial for applying layout modifications and styling to the horizontal stack view specifically.
    * - Description: This constant uniquely identifies the horizontal stack
    *                view within the `TagBarView` component, allowing for
    *                targeted animations and state changes specifically within
    *                this view's context.
    */
   static let nameSpace: String = "hstack"
   /**
    * Highlight corner radius
    * - Description: This constant defines the corner radius for the highlight
    *                view in the TagBarView component. It is used to give the
    *                highlight view rounded corners for a smoother, more visually
    *                pleasing appearance.
    */
   static let cornerRadius: CGFloat = 8
   /**
    * The spacing between tag items in the TagBarView component.
    * - Description: This constant defines the horizontal spacing between
    *                each tag item in the TagBarView component. It is used to
    *                ensure consistent and visually pleasing separation between
    *                adjacent tags.
    */
   static let spacing: CGFloat = 0 // was 4 in legacy
   /**
    * The height of the TagBarView component
    * - Description: This constant defines the height of the TagBarView
    *                component. It is used to ensure a consistent and visually
    *                pleasing height for the TagBarView across different screen
    *                sizes and orientations.
    */
   static let height: CGFloat = 80
}
/**
 * Typealiases used by the TagBarView component
 * - Description: Typealiases in this extension provide a shorthand for
 *                various callback and handler types used throughout the
 *                TagBarView component, improving code readability and
 *                maintainability.
 */
extension TagBarView {
   /**
    * Callback signature for item press
    * - Description: Defines a closure type for handling the event when a tag
    *                item is pressed within the `TagBarView`. This allows the
    *                `TagBarView` to execute a callback function with the index
    *                of the selected item, enabling actions to be triggered in
    *                response to user interaction.
    * - Parameter idx: The index of the item that was pressed.
    */
   typealias HandleItemPress = (_ idx: Int) -> Void
}
