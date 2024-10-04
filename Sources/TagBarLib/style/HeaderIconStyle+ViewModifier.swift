import SwiftUI
import HybridColor
/**
 * View modifier
 * - Description: A `ViewModifier` for applying a consistent icon style to header elements. It configures the icon's appearance including its name, size, color, background, stroke, and padding.
 * - Fixme: ⚠️️ Use modifiers for some of the styling here etc
 */
fileprivate struct HeaderIconViewModifier: ViewModifier {
   /**
    * The name of the icon to display.
    */
   let iconName: String
   /**
    * The size of the icon to display.
    */
   let iconSize: CGFloat
   /**
    * The color of the icon to display.
    */
   let iconColor: Color
   /**
    * The background color of the icon to display.
    */
   let backgroundColor: Color
   /**
    * The color of the stroke around the icon to display.
    */
   let strokeColor: Color
   /**
    * The width of the stroke around the icon to display.
    */
   let strokeWidth: CGFloat
   /**
    * The padding around the icon to display.
    */
   let padding: CGFloat
}
/**
 * Content
 */
extension HeaderIconViewModifier {
   /**
    * The main body of the view modifier.
    * This function composes the icon, stroke, and fill views to create the final icon view.
    * - Fixme: ⚠️️ Remake this as image modifier and make it more modular etc, find the image modifier code somewhere etc
    * - Fixme: ⚠️️ There might be a simpler way of adding both foreground color and stroke to a circle
    * - Parameter content: The content view that this modifier is applied to.
    * - Returns: A view that represents the modified content with the icon, stroke, and fill applied.
    */
   @ViewBuilder func body(content: Content) -> some View {
      content // - Fixme: ⚠️️ remove this?
      ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
         icon // The icon view with the specified properties.
         stroke // The stroke view with the specified properties. // - Fixme: ⚠️️ is this in use? doesn't seem like it
         fill // The fill view with the specified properties.
      }
   }
   /**
    * Icon
    * - Fixme: ⚠️️ try to figure out how use padding for sizing?
    */
   var icon: some View {
      Circle() // icon
         .foregroundColor(backgroundColor)
         .frame(width: iconSize + padding, height: iconSize + padding, alignment: .center)
         .aspectRatio(contentMode: .fit) // - Fixme: ⚠️️ probably not needed
      // - Fixme: ⚠️️ make a stroke circle modifier for this
   }
   /**
    * Stroke
    * - Fixme: ⚠️️ is this in use? doesn't seem like it, or?
    */
   var stroke: some View {
      Circle()
         .stroke(strokeColor, lineWidth: strokeWidth) // Applies a stroke to the circle with the specified color and width.
         .foregroundColor(.clear) // Sets the foreground color to clear to ensure the stroke is visible.
         .frame(
            width: iconSize + padding, // Sets the width of the stroke circle including padding.
            height: iconSize + padding, // Sets the height of the stroke circle including padding.
            alignment: .center // Aligns the stroke circle to the center.
         ) // Sets the frame of the stroke circle with the specified size and alignment.
         // - Fixme: ⚠️️ probably not needed
         .aspectRatio(contentMode: .fit) // Maintain the aspect ratio of the stroke circle.
   }
   /**
    * Fill
    * - Fixme: ⚠️️ make a background circle modifier for this
    * - Fixme: ⚠️️ use the icon modifier on this:
    */
   var fill: some View {
      Image(systemName: iconName) // Loads the system image with the specified name.
         .resizable() // Makes the image resizable.
         .aspectRatio(contentMode: .fit) // Sets the aspect ratio of the image to fit within the frame.
         .foregroundColor(iconColor) // Sets the foreground color of the image.
         .frame(width: iconSize, height: iconSize) // Sets the frame of the image to the specified size.
   }
}
/**
 * Modifier
 */
extension View {
   /**
    * A convenient modifier for styling an image.
    * - Fixme: ⚠️️ Make an image modifer that targets images, see that stackoverflow post somewhere, still relevant?
    * - Fixme: ⚠️️ add stroke to this?
    * - Fixme: ⚠️️ this could be better if we just made a struct? instead of a modifier, and instead add modifer to the icon at least?
    * - Parameters:
    *   - iconName: The name of the icon to display.
    *   - iconSize: The size of the icon to display.
    *   - padding: The padding around the icon.
    *   - iconColor: The color of the icon.
    *   - backgroundColor: The background color of the icon.
    *   - strokeColor: The color of the stroke around the icon.
    *   - strokeWidth: The width of the stroke around the icon.
    * - Returns: A view representing the styled image.
    */
   @warn_unqualified_access // ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-swiftui-modifiers-safer-to-use-with-warn-unqualified-access
   func headerIconViewModifier(iconName: String, iconSize: CGFloat = 16, padding: CGFloat = 16, iconColor: Color = .white, backgroundColor: Color = Color(light: .darkGray.opacity(0.1), dark: .darkGray.opacity(0.2)), strokeColor: Color = Color.blackOrWhite, strokeWidth: CGFloat = 2) -> some View {
      self.modifier(
         HeaderIconViewModifier(
            iconName: iconName, // The name of the icon to display.
            iconSize: iconSize, // The size of the icon to display.
            iconColor: iconColor, // The color of the icon to display.
            backgroundColor: backgroundColor, // The background color of the icon to display.
            strokeColor: strokeColor, // The color of the stroke around the icon.
            strokeWidth: strokeWidth, // The width of the stroke around the icon.
            padding: padding // The padding around the icon.
         )
      )
   }
}
