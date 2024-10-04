import SwiftUI
import HybridColor
/**
 * Preview
 * - Fixme: ⚠️️ add darkmode to preview?
 * - Fixme: ⚠️️ Add preview for macOS?
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
//   .padding()
//   .frame(maxWidth: .infinity) // wide as allowed // .frame(width: UIScreen.main.bounds.width / 1.205, height: 44)
//   .font(.body.bold()) // text
//   .foregroundColor(.white)
//   .background(
//      Capsule()
//         .fill(Color.black)
//      )
//extension ButtonStyle where Self == HeaderIconStyle {
//   static func headerIconStyle(iconName: String, iconSize: CGFloat = 16, padding: CGFloat = 16, iconColor: Color = .white, backgroundColor: Color = Color.init(uiColor: .darkGray).opacity(0.2), strokeColor: Color = .white.opacity(0.5), strokeWidth: CGFloat = 2) -> Self {
//      return .init(iconName: iconName, iconSize: iconSize, iconColor: iconColor, backgroundColor: backgroundColor, strokeColor: strokeColor, strokeWidth: strokeWidth, padding: padding)
//   }
//}
