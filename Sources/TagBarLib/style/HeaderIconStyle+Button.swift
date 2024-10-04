import SwiftUI
import HybridColor
/**
 * - Note: Add extension `ButtonStyle where Self == HeaderIconStyle` later if we need to store the style for switching etc
 */
extension Button {
   /**
    * Applies a custom style to a button to make it look like a header icon.
    * - Description: This method customizes a `Button` to have a header icon appearance, using the `HeaderIconStyle`. It sets the icon's name, size, padding, color, background color, stroke color, and stroke width to the button, creating a consistent look that matches the header's design language.
    * - Fixme: ⚠️️ Move color consts to pallet? 👈, nope, tagbarlib doesnt have access to interfacelib
    * - Parameters:
    *   - iconName: The name of the icon to display on the button.
    *   - iconSize: The size of the icon to display on the button.
    *   - padding: The padding around the icon on the button.
    *   - iconColor: The color of the icon on the button.
    *   - backgroundColor: The background color of the button.
    *   - strokeColor: The color of the stroke around the button.
    *   - strokeWidth: The width of the stroke around the button.
    * - Returns: A view representing the styled button.
    */
   func headerIconStyle(iconName: String, iconSize: CGFloat = 16, padding: CGFloat = 16, iconColor: Color = Color.whiteOrBlack, backgroundColor: Color = Color(light: .lightGray, dark: .darkGray).opacity(0.2), strokeColor: Color = Color.whiteOrBlack.opacity(0.5), strokeWidth: CGFloat = 1) -> some View {
      // Creates a new instance of HeaderIconStyle with the provided parameters.
      let buttonStyle: HeaderIconStyle = .init(
         iconName: iconName, // The name of the icon to display.
         iconSize: iconSize, // The size of the icon to display.
         iconColor: iconColor, // The color of the icon to display.
         backgroundColor: backgroundColor, // The background color of the icon to display.
         strokeColor: strokeColor, // The stroke color of the icon to display.
         strokeWidth: strokeWidth, // The width of the stroke to display.
         padding: padding) // The padding of the icon to display.
      // Applies the buttonStyle to the button and returns the styled view.
      return self.buttonStyle(buttonStyle)
   }
}
