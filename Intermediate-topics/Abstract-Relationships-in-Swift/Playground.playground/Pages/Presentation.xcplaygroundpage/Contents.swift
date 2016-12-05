//:

//: ## Abstract Relationships in Swift

//: ### Andrei Raifura
//: ##### iOS @ YOPESO

//:

//:

//: ## Types
// Concrete

let x: Int

// Abstract

struct Box<Wrapped> {
  let x: Wrapped
}

Box<String>(x: "")

protocol Conference {
  associatedtype Location
}

















/*:
 ## Recap
 * Protocols give us design flexibility
    - Default implementation
    - Protocol composition
 * Generics and associated types
 * Type erasure
 */


/*:
 ## Resources

 #### Associated types
 * http://www.russbishop.net/swift-associated-types
 
 #### Type erasure
 * http://krakendev.io/blog/generic-protocols-and-their-shortcomings
 * https://realm.io/news/altconf-hector-matos-type-erasure-magic/
 
 */

//:

//:

//:

//: # Thank you! 🙌

//:

//:

//:
//: `#CodeWăy`


