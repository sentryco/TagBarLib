import SwiftUI
import HybridColor
/**
 * Preview
 * - Fixme: ⚠️️ Add PreviewContainer as debug fenced internal view
 */
#Preview {
   struct DebugView: View {
      var body: some View {
         EmptyView()
            .headerIconViewModifier(
               iconName: "heart",
               iconSize: 24,
               padding: 30,
               // - Fixme: ⚠️️ for some reason whiteOrBlack doesnt work here
               iconColor: .white.opacity(0.8), // whiteOrBlack.opacity(0.8)
               backgroundColor: .white.opacity(0.2), // whiteOrBlack
               strokeColor: .white.opacity(0.4), // whiteOrBlack
               strokeWidth: 2
            )
            .frame(width: 54, height: 54)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
      }
   }
   return DebugView()
}
