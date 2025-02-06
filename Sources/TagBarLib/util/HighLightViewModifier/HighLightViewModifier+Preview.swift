import SwiftUI
/**
 * Preview
 * - Description: This preview demonstrates the usage of the `HighLightViewModifier` on a `Rectangle` view. 
                  It creates a rectangle with a clear fill and applies the `HighLightViewModifier` to it, 
                  resulting in a highlighted area with a rounded corner background. The size of the highlighted 
                  area is defined by the `rect` parameter, and the roundness of the corners is defined by the 
                  `cornerRadius` parameter.
 * - Fixme: ⚠️️ seems a bit out of order ? still relevant?
 */
#Preview {
   Rectangle()
      .fill(.clear)
      .frame(width: .infinity, height: 40)
      .highLightViewModifier(
         rect: .init(
            origin: .zero,
            size: .init(width: 100, height: 40)
         ),
         cornerRadius: 10 // was 8 in legacy
      )
      .padding()
      .background(Color.black) // Color.blackOrWhite
}
