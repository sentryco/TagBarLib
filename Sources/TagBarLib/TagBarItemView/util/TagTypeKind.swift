import Foundation
/**
 * Protocol for defining a `TagTypeKind`, which represents a type of tag that can be used in a `TagBarView`
 * - Description: This protocol defines the requirements for a tag type that can be used within a `TagBarView`. 
 *                It includes properties for the title and icon URL of the tag, which are essential for displaying 
 *                the tag correctly in the user interface.
 * - Fixme: ⚠️️ why is this protocol needed? add rational? use copilot?
 */
public protocol TagTypeKind {
   /**
    * The title of the tag type
    */
   var title: String { get }
   /**
    * The URL of the icon for the tag type
    */
   var iconURL: String { get }
}
