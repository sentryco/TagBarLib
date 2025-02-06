import Foundation
/**
 * Represents an item in the `TagBar`
 * - Description: The `TagBarItem` struct represents an individual item in the `TagBar`. 
 *                Each item has a title and an associated icon URL. The item can be 
 *                in an active or inactive state.
 * - Remark: Has icon and label and active / in-active state
 * - Note: We don't need UUID as id, because we use int index as the id, - Fixme: ⚠️️ but why? add some reasoning, use copilot to discuss this
 * - Note: Alt name: `TagBarItemModel`
 * - Fixme: ⚠️️ Maybe to animate icon selection state? 0.2 quick transition? elaborate? move to github issues?
 */
public struct TagBarItem: TagTypeKind {
   /**
    * The title of the tag bar item.
    * - Description: This property holds the title string for the tag bar item, 
    *                which is displayed as the label for the item in the TagBar.
    */
   public var title: String
   /**
    * The URL of the icon associated with the tag bar item.
    * - Description: This property holds the URL string for the icon image that represents the tag bar item visually. 
    *                It is used to fetch and display the icon next to the tag item's title in the TagBar.
    */
   public var iconURL: String
   /**
    * Initializes a new instance of TagBarItem with the specified title and icon URL.
    * - Description: This initializer creates a new instance of TagBarItem using the provided title and icon URL. 
    *                The title parameter sets the display name for the tag item in the TagBar, 
    *                while the iconURL parameter sets the URL for the icon that will be displayed 
    *                alongside the title in the TagBar.
    * - Important: ⚠️️ Required because it's public
    * - Remark: The `title` parameter specifies the title string for the tag item.
    * - Remark: The `iconURLStr` parameter specifies the icon URL string for the tag item.
    * - Parameters:
    *   - title: The title of the tag bar item.
    *   - iconURL: The URL of the icon associated with the tag bar item.
    */
   public init(title: String, iconURL: String) {
      self.title = title
      self.iconURL = iconURL
   }
}
