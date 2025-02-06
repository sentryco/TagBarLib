#if DEBUG
import SwiftUI
import HybridColor
/**
 * Preview
 * - Description: Provides a preview of the `TagBarView` component within a debug environment. This preview setup includes a `DebugView` struct that initializes the `TagBarView` with dummy data and state bindings for interactive testing. The preview is configured to display the component in a dark color scheme and within a context that simulates its appearance and behavior in a live application.
 * - Important: ⚠️️ Use canvas device settings to toggle dark / light mode
 * - Note: The frame modifier is used to set the maximum width and height of the TagBarView to ensure it fits within the preview container. This is particularly useful for previewing the view in a specific size context.
 */
#Preview {
     @Previewable @State var selectedIdx: Int = 0
       TagBarView( // Creates an instance of TagBarView for preview purposes
            tagTypes: TagBarView.tagItems, // Passes the static tagItems array from TagBarView as the tagTypes parameter.
            selection: $selectedIdx // Binds the selectedIdx state variable to the selection parameter.
         )
         .frame(maxWidth: .infinity, maxHeight: 48) // Sets the maximum width and height of the TagBarView to infinity and 48 respectively.
         .padding(.vertical, 12)
         .padding(.horizontal, .zero)
         //.previewLayout(.sizeThatFits) // Sets the preview layout to size that fits the content
         .background(Color.gray.opacity(0.16)) // Sets the background color of the preview to black
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      // .environment(\.colorScheme, .dark)
}
/**
 * Preview demo data
 */
extension TagBarView {
   /**
    * Dummy data
    * - Description: Provides a list of string labels used for generating
    *                dummy `TagBarItem` views in the preview environment.
    *                These labels represent the titles of the tags that will
    *                be displayed in the `TagBarView` for demonstration
    *                purposes.
    * - Fixme: ⚠️️ Use better test data
    */
   fileprivate static let list: [String] = [
      "First Row",
      "Second Row",
      "Third Row",
      "Fourth Row",
      "Fifth Row",
      "Sixth Row",
      "Seventh Row"
   ]
   /**
    * Provides a static array of `TagTypeKind` for preview purposes.
    * - Description: This static array is used to populate the `TagBarView`
    *                with a set of predefined `TagTypeKind` instances. Each
    *                instance represents a tag item with a title and an
    *                associated icon, which is used to demonstrate the
    *                appearance and functionality of the `TagBarView` in a
    *                preview environment.
    * - Fixme: ⚠️️ Add custom icons to debug test
    */
   static let tagItems: [TagTypeKind] = TagBarView.list.map {
      TagBarItem(title: $0, iconURL: "heart")
   }
}
#endif
