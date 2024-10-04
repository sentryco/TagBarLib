import SwiftUI
import HybridColor
/**
 * Used for `back` and `more` button in header
 * - Description: The `HeaderIconStyle` is a `ButtonStyle` used to style header buttons with a consistent design language. It defines the visual elements of the button, such as icon name, size, color, background, stroke color, and padding, ensuring a cohesive look for all header buttons.
 * - Note: "Metro-Noir" esque ButtonStyle
 * - Note: Alternative name: `HeaderIconButtonStyle`
 * - Fixme: ⚠️️ Rename to ? or too long and just keep as is?
 * ## Examples:
 * IconButtonStyle(strokeColor, backgroundColor, iconColor, size, iconSize)
 */
struct HeaderIconStyle: ButtonStyle {
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
    * The stroke color of the icon to display.
    */
   let strokeColor: Color
   /**
    * The width of the stroke to display.
    */
   let strokeWidth: CGFloat
   /**
    * The padding of the icon to display.
    */
   let padding: CGFloat
   /**
    * Creates the body of the button.
    * - Parameter configuration: The configuration of the button.
    * - Returns: A view representing the body of the button.
    */
   func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .headerIconViewModifier( // Apply the headerIconViewModifier to the configuration label
            iconName: iconName, // The name of the icon to display.
            iconSize: iconSize, // The size of the icon to display.
            padding: padding, // The padding of the icon to display.
            iconColor: iconColor, // The color of the icon to display.
            backgroundColor: backgroundColor, // The background color of the icon to display.
            strokeColor: strokeColor, // The stroke color of the icon to display.
            strokeWidth: strokeWidth // The width of the stroke to display.
         )
   }
}
