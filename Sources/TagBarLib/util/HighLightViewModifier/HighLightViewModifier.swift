import SwiftUI
import HybridColor
/**
 * - Description: This extension adds a highlight view modifier to a view,
 *                allowing for the creation of a highlighted area with a
 *                rounded corner background.
 * - Abstract: Highlights a `TagBarItem` with a rounded corner background
 */
extension HighLightViewModifier {
   /**
    * - Desctiption: This function applies a highlight view modifier to the
    *                content view, creating a highlighted area with a rounded
    *                corner background.
    * - Fixme: ⚠️️ Clean up colors a bit etc, in what way?
    * - Fixme: ⚠️️ Use this as the foreground color etc: `Palette.SideBar.highlight`
    * - Parameter content: The view to which the highlight view modifier is applied.
    * - Returns: A view with the highlight view modifier applied.
    */
   func body(content: Content) -> some View {
      content
         .background {
            roundedRectangle
         }
   }
}
/**
 * Content
 */
extension HighLightViewModifier {
   /**
    * Rounded rectangle
    * - Description: This view represents a rounded rectangle that is used as a background for the highlighted area. 
    *                It is configured with a specific corner radius and color scheme depending on the current mode 
    *                (light or dark). The size and position of the rectangle are determined by the `rect` property.
    */
   fileprivate var roundedRectangle: some View {
      RoundedRectangle(cornerRadius: cornerRadius) // A view that highlights a `TagBarItem` with a rounded corner background
         .foregroundColor( // The background color of the highlight view.
            Color(
               light: .gray.opacity(0.2), // The background color for light mode with 20% opacity.
               dark: .white.opacity(0.14) // The background color for dark mode with 14% opacity.
            )
         )
         .frame( // Sets the frame of the highlight view
            width: rect.width,
            height: rect.height
         )
         .position( // We have to do some alignment calculation like belolow because it seems .background in hstack has some strange cordinate system, maybe try using ZStack?
            x: rect.minX + (rect.width / 2),
            y: rect.minY + (rect.height / 2)
         )
   }
}
/**
 * Extension to `HighlightView` to provide setter methods for highlighting a `TagBarItem`
 * - Description: This extension provides a method to apply a highlight view modifier to a `TagBarItem`. 
 *                The highlight view modifier creates a highlighted area with a rounded corner background 
 *                around the `TagBarItem`.
 * - Fixme: ⚠️️ This can be constrained with where clause, check other code 
 */
extension View {
   /**
    * Sets the highlight view to the specified `TagBarItem` rect
    * - Description: This function applies a highlight view modifier to a specified `TagBarItem` within a `TagBarView`. 
    *                The highlight view modifier creates a highlighted area with a rounded corner background around 
    *                the `TagBarItem`, visually indicating it as the currently selected item.
    * - Parameters:
    *   - rect: The rectangle that defines the area to be highlighted.
    *   - cornerRadius: The corner radius of the highlight view.
    * - Returns: A view with the highlight view modifier applied.
    * ## Examples:
    * Rectanle().highLightViewModifier(rect: .zero, cornerRadius: .zero)
    */
   func highLightViewModifier(rect: CGRect, cornerRadius: CGFloat) -> some View {
      let modifier = HighLightViewModifier(
         rect: rect, // The rectangle that defines the area to be highlighted.
         cornerRadius: cornerRadius // The corner radius of the highlight view.
      )
      return self.modifier(modifier)
   }
}
/**
 * View modifier
 */
fileprivate struct HighLightViewModifier: ViewModifier {
   /**
    * The rectangle that defines the area to be highlighted.
    * - Description: This property defines the rectangle area that will be highlighted. 
    *                It is used to determine the size and position of the highlight view.
    */
   let rect: CGRect
   /**
    * The corner radius of the highlight view.
    * - Description: This property sets the corner radius of the highlight view. 
    *                A larger value will result in a more rounded corner.
    */
   let cornerRadius: CGFloat
}
