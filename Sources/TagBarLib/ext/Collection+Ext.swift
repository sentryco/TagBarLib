import Foundation
/**
 An extension to the `Collection` protocol that provides a safe subscript method.

 This extension adds a subscript method that safely returns the element at the specified index if it exists, or `nil` if the index is out of bounds.

 **Usage:**
 ```swift
 let array = [1, 2, 3]
 let value = array[safe: 1]     // value is 2
 let nilValue = array[safe: 5]  // nilValue is nil
 ```
*/
extension Collection {
    /**
     Returns the element at the specified index if it is within bounds, otherwise `nil`.

     - Parameter safe index: The index of the element to retrieve.
     - Returns: The element at the specified index if it exists; otherwise, `nil`.
     */
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
