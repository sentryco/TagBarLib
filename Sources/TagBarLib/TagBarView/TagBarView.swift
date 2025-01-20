import SwiftUI
/**
 * Customized "Scrollable HStack" with animated highlight
 * - Abstract: `TagBar` represents the way to navigate different categories
 * - Description: `TagBar` is an isolated component that communicates with other components through callbacks. The caller of this class is responsible for setting the selected item and scrolling to visible, among other things.
 * - Remark: Is essentially a Horizontal list of buttons
 * - Remark: Has selection state that animates on the x-axis
 * - Remark: `TagBar` is a isolated component that communicate with other components through callbacks
 * - Remark: The caller of this class is responsible for setting the selected item and scrolling to visible etc
 * - Remark: SwiftUI `List` doesn't support rendering and scrolling in a horizontal axis, but you achieve that with ScrollView and LazyHStack.
 * - Note: This is its own repo so we can have less code in app target, own docs, tests etc, and own preview, microservice style!!!
 * - Note: We could use empty trash edition of the trash icon when trash is empty but it doesnt make complete sense from an UX POV, anyways here is the icon we could use: https://feathericons.com/?query=trash
 * - Fixme: ⚠️️ Mark all tagbar code iOS only? 👈 (Do this when cleaning up)
 * - Fixme: ⚠️️ Maybe make methods that scrolls to start and end? see legacy for code, add this if use case for emerges etc
 * - Fixme: ⚠️️ Consider opensourcing this repo 👈
 * - Fixme: ⚠️️ Use uuid as selected index? or overkill?
 */
public struct TagBarView: View {
   /**
    * The model for the tag types
    * - Description: Provides a list of tag types that the `TagBarView` can display.
    */
   public let tagTypes: [TagTypeKind]
   /**
    * The left and right margin of the `TagBarView` component
    * - Description: Provides internal horizontal margins to ensure content is inset properly within the view boundaries.
    * - Important: ⚠️️ Using this as padding avoids clipping that would occure with normal padding etc
    * - Fixme: ⚠️️ move 12 to const? 👈
    */
   internal let internalHorizontalMargin: CGFloat = 12
   /**
    * Provides the index of the currently selected tag within the `tagTypes` array.
    * - Important: ⚠️️ We must use a selction to init
    * - Note: To scroll to start: just set selection 0
    * - Note: To scroll to end just set selectiom to tagTypes.count - 1
    * - Note: mindset is that the user of this struct has the state of selection
    * - Fixme: ⚠️️ Try using id as selection instead, will require setting the selection on init etc  (UUID)?
    */
   @Binding public var selection: Int
   /**
    * - Description: This state variable holds the current position and size
    *                of the highlight view. It is updated whenever a new tag is
    *                selected, causing the highlight view to animate to the new
    *                position.
    * - Note: `.onAppear` and is selected set highlightRect which then sets the bellow, default should be .zero
    */
   @State internal var highlight: CGRect = .zero // Sets the highlight view to the specified `TagBarItem`.
   /**
    * Initializes a new instance of `TagBarView`.
    * - Description: This initializer sets up the `TagBarView` instance with
    *                the provided `tagTypes` model and initializes the
    *                `selection` binding which represents the currently
    *                selected tag index.
    * - Note: This method sets up the `TagBarView` instance with the provided `tagTypes` model.
    * - Note: It also initializes the `selection` binding
    * - Fixme: ⚠️️ Add an init that converts selectedTagType to selection-index etc?
    * - Parameters:
    *   - tagTypes: An array of `TagTypeKind` representing the types of tags to be displayed in the `TagBarView`.
    *   - selection: A `Binding` to an `Int` that represents the currently selected tag index.
    */
   public init(tagTypes: [TagTypeKind], selection: Binding<Int>) {
      self.tagTypes = tagTypes
      self._selection = selection
   }
}
