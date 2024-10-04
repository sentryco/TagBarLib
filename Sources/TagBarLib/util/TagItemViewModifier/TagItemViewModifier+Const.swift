import SwiftUI
/**
 * Constants used by the `TagItemView` class.
 * - Note: Ideal height should be itemHeight and icon 24
 */
extension TagItemViewModifier {
   /**
    * The horizontal margin between tag items.
    */
   static let horizontalMargin: CGFloat = 12
   /**
    * The vertical margin between tag items.
    */
   static let verticalMargin: CGFloat = 8
   /**
    * The padding for the tag item.
    */
   static let padding: EdgeInsets = {
      .init(
         top: Self.verticalMargin, // Sets the top margin to the static verticalMargin value
         leading: Self.horizontalMargin, // Sets the leading margin to the static horizontalMargin value
         bottom: Self.verticalMargin, // Sets the bottom margin to the static verticalMargin value
         trailing: Self.horizontalMargin // Sets the trailing margin to the static horizontalMargin value
      )
   }()
}
