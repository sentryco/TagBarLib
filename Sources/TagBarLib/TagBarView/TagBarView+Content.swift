import SwiftUI
/**
 * Content
 * - Fixme: ⚠️️ Possibly add fall-off masking at edges, see how iOS notes does this etc
 * - Fixme: ⚠️️ Ask copilot if it can improve this code or simplify parts of it etc, it's trycky, might stop working etc, but you can try, and make sure UITests keep runining etc
 */
extension TagBarView {
   /**
    * Body content
    * - Description: This method is used to generate the body content of the `TagBarView`. It creates a `ScrollViewReader` that allows for scrolling operations within the view. The `scrollView` function is then called with the `ScrollViewProxy` reader as a parameter.
    * - Parameter reader: The `ScrollViewProxy` instance used for scrolling operations within the `TagBarView`.
    * - Returns: A `ScrollView` component with a horizontal stack of tag items.
    * - Fixme: ⚠️️ Use @selected state, see other code regarding this 👈
    */
   public var body: some View {
      ScrollViewReader { (_ reader: ScrollViewProxy) in // We could use this, see for code: https://developer.apple.com/documentation/swiftui/scrollviewreader
         scrollView(reader: reader) // Calls the scrollView function with the ScrollViewProxy reader as a parameter.
      }
   }
}
/**
 * Components
 */
extension TagBarView {
   /**
    * Scroll-view
    * - Abstract: Creates a horizontal stack of tag items.
    * - Description: This function creates a `ScrollView` that allows the `TagBarView` to display its tag items in a horizontally scrollable view. It uses the provided `ScrollViewProxy` to manage the scrolling behavior and position of the `TagBarView`.
    * - Fixme: ⚠️️ Consider using `UIColor.systemGroupedBackground` as background color etc
    * - Parameter reader: The `ScrollViewProxy` instance used for scrolling operations within the `TagBarView`.
    * - Returns: A `ScrollView` component with a horizontal stack of tag items.
    */
   fileprivate func scrollView(reader: ScrollViewProxy) -> some View {
      ScrollView( // Initializes a ScrollView component.
         .horizontal, // Specifies the axis of the scroll view as horizontal.
         showsIndicators: false // Hides the scroll indicators.
      ) {
         hStack(reader: reader) // Calls the hStack function with the ScrollViewProxy reader as a parameter.
      }
      .coordinateSpace(name: Self.coordinateSpace) // Assigns the scroll view to a named coordinate space.
      .contentMargins(.horizontal, self.internalHorizontalMargin) // Adds to the content it self: (Applies to all scrollable containers within the scope) .contentMargins(Edge.Set.init(arrayLiteral: [Edge.leading(12), Edge.trailing(12)]))
   }
   /**
    * Creates a horizontal stack of tag items.
    * - Description: This function generates a horizontal stack view containing all the tag items, allowing for horizontal scrolling.
    * - Parameter reader: The `ScrollViewProxy` instance used for scrolling operations within the `TagBarView`.
    * - Returns: A `View` representing the horizontal stack of tag items.
    */
   fileprivate func hStack(reader: ScrollViewProxy) -> some View {
      HStack(spacing: Self.spacing) { // We can also use LazyHStack here
         tagItems(reader: reader)
      }
      .coordinateSpace(name: Self.nameSpace) // This solution was found here: https://www.swiftanytime.com/blog/geometry-reader-in-swiftui
      .highLightViewModifier( // Applies the highlight view modifier to the horizontal stack.
         rect: highlight, // Specifies the rectangle for the highlight view.
         cornerRadius: Self.cornerRadius // Sets the corner radius of the highlight view to the value defined in TagBarView constants.
      )
   }
   /**
    * Creates an array of `TagItem` views
    * - Description: This function generates a series of `TagItem` views from the `tagTypes` array. Each `TagItem` view represents a selectable tag with a title and optional icon, laid out in a horizontal sequence for the `TagBarView`.
    * - Parameter reader: The `ScrollViewProxy` instance used for scrolling operations within the `TagBarView`.
    * - Returns: A `View` representing the array of `TagItem` views.
    */
   fileprivate func tagItems(reader: ScrollViewProxy) -> some View {
      ForEach(Array(tagTypes.indices), id: \.self) { i in // Iterates over each index in the tagTypes array.
         tagItem( // Calls the tagItem function to create a tag item view.
            tagType: tagTypes[i], // Passes the tag type at index i from the tagTypes array.
            i: i, // Passes the current index i.
            reader: reader // Passes the ScrollViewProxy instance for scrolling operations.
         )
      }
   }
}
/**
 * Maker (private)
 */
extension TagBarView {
   /**
    * Tag-item
    * - Abstract: Creates a tag item view with a text label and an icon.
    * - Description: This function creates a view for an individual tag item within the `TagBarView`. It displays the tag's title and, if available, an icon. The view is styled to indicate whether it is the currently selected tag and is interactive, responding to tap gestures by updating the selection state.
    * - Important: ⚠️️ The vertical padding fix has a side effect in that the padding is added to the entire height of the component, so setting padding on the component doesnt hit the edge. So it comes with built in padding of sorts, fix later
    * - Note: This was static, but seems better to use non static, as static adds many params etc
    * - Note: It is possible to use a button as well but the issue remains with detecting hit in UITest
    * - Note: relevant to the hitarea discussion: https://stackoverflow.com/questions/58696455/swiftui-ontapgesture-on-color-clear-background-behaves-differently-to-color-blue/60151771#60151771
    * - Fixme: ⚠️️ It might be possible to fix the padding annoyance, with a button. but figure out how to style a button without a down state first. probably easy
    * - Parameters:
    *   - tagType: The type of the tag item.
    *   - i: The index of the tag item.
    *   - reader: The ScrollViewProxy instance used for scrolling operations within the TagBarView.
    * - Returns: A View representing the tag item.
    */
   fileprivate func tagItem(tagType: TagTypeKind, i: Int, reader: ScrollViewProxy) -> some View {
      Text(tagType.title) // Button doesn't work with press action out of the box, so we use text and onGesture
         .disabled(true) // We need to be able to tap the background
         .tagItemViewModifier( // Applies the tagItemViewModifier to the Text view.
            isSelected: selection == i, // Determines if the current tag item is selected based on the current selection state.
            iconName: tagType.iconURL // Specifies the URL of the icon for the current tag item.
         )
         .accessibilityElement(children: .contain) // ⚠️️ Enable accessID on container, since hstack is used in view modifer
         .accessibilityIdentifier(tagTypes[i].title)  // Needed for accessibility targeting via label
         .background( // ⚠️️ Can also be put in overlay
            backgroundView( // Calls the backgroundView function to generate the background view for the tag item.
               i: i, // Passes the current index i to the backgroundView function.
               reader: reader // Passes the ScrollViewProxy instance to the backgroundView function for scrolling operations.
            )
         )
         .padding(.vertical) // ⚠️️ This is the key to makeing the hit area in si,ulator and uitests work
         .onTapGesture { // On press
            handleItemPress(index: i) // Calls the handleItemPress function with the current index i as the parameter.
         }
   }
   /**
    * Background view - "HighlightView"
    * - Description: This method generates a transparent background view that is used to capture the geometry of the tag item for dynamic layout adjustments. It is essential for managing the visual highlight of the selected tag by updating its position and ensuring it is visible within the ScrollView.
    * - Note: We keep this in a seperate method to keep things simpler
    * - Note: Ref: https://swiftwithmajid.com/2023/06/27/mastering-scrollview-in-swiftui-scroll-position/
    * - Note: Ref: https://stackoverflow.com/questions/57028165/swiftui-scrollview-how-to-modify-content-offset-aka-paging
    * - Note: Seems we can use a proxy: https://github.com/Amzd/ScrollViewProxy and https://stackoverflow.com/questions/64500936/content-offset-in-scrollview-swiftui
    * - Note: `geomreader` ref: https://stackoverflow.com/questions/66198665/how-to-check-if-item-is-visible-swiftui-scrollview
    * - Note: `geomreader` solution: https://medium.com/@Karunpant/perspective-frames-in-swiftui-50ba1c45eaa8
    * - Note: `.scrollTargetLayout()` // ref: https://swiftwithmajid.com/2023/06/27/mastering-scrollview-in-swiftui-scroll-position/
    * - Note: This has nuanced info on `GeometryReader`: https://betterprogramming.pub/geometryreader-blessing-or-curse-1ebd2d5005ec
    * - Note: Great tut on geomReader: https://designcode.io/swiftui-handbook-detect-screen-size
    * - Note: ⭐ this adds scroll to top, we could just make a var conencect to this called scrollTOTop that calls this and one for scroll to bottom etc some discussion here. https://stackoverflow.com/questions/66873992/how-can-i-programmatically-scroll-in-swiftui
    * - Fixme: ⚠️️ We could move the `GeometryReader` code into a view modifier?
    * - Fixme: ⚠️️ maybe use that geometryreader extension?
    * - Parameters:
    *   - i: selected index
    *   - reader: needed to scroll to the selected item on change
    * - Returns: invisible background, only needed for getting rect
    */
   func backgroundView(i: Int, reader: ScrollViewProxy) -> some View {
      GeometryReader { (_ geo: GeometryProxy) in // It's also possible to store geom reader in a let: https://stackoverflow.com/a/57936169/5389500, potential solution without reader is to get inner and outer geom reader: https://stackoverflow.com/a/75823183/5389500 and https://stackoverflow.com/questions/66198665/how-to-check-if-item-is-visible-swiftui-scrollview?noredirect=1&lq=1
         let rect: CGRect = geo.frame(in: .named(Self.nameSpace)) // Converts the GeometryProxy to a CGRect within the specified coordinate space.
         Color.clear.opacity(0.0) // We just want the reader to get triggered, so let's use an empty color
            .onAppear { // we also need to account for not animating the first time
               if selection == i { // Checks if the current selection matches the index of the current tag item.
                  $highlight.wrappedValue = rect // No anim, just update highlight frame
               }
            }
            .onChange(of: selection) { // When selection changes, move highlight
               if selection == i { // Checks if the current selection matches the index of the current tag item.
                  withAnimation(Animation.easeInOut(duration: 0.3)) { // Solution for this found here: https://stackoverflow.com/questions/67488226/swiftui-scrollview-scroll-to-relative-position
                     $highlight.wrappedValue = rect // Set the highlight view to the selected `TagBarItem` we set state of highlight bg here, Animates the highlight view to the specified `TagBarItem`.                                 highlightX = rect.minX + (rect.width / 2)
                     reader.scrollTo(i) // This method finds the container of the identified view, and scrolls the minimum amount to make the identified view wholly visible. .animation(.default) // value.scrollTo(selection/*, anchor: .top*/ )
                  }
               }
            }
            .disabled(true) // Disables the background view.
      }
   }
}
