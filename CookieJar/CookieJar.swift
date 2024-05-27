//
//  CookieJar.swift
//  CookieJar
//
//  Created by George Shoemaker on 5/17/24.

// This file contains types to model cookies that can be contained in a jar
// A CookieJar behaves like a "Bag", an abstract data structure

// A "Bag" has the followning properties:
//  - un ordered collection of items, in this case Cookie
//  - allows for duplicates
//  - can easily tell you the quantity of items in the collection

// Hopefully we can imagine storing cookies in jars
// We can take a cookie out, and place it in a different jar
// You don't know which exact cookie you'll get when reaching into the jar (unordered)

import Foundation // for using UUID

// There are strictly 3 cookie flavors
// Top help enforce this, I’ve captured the flavors as an enum named “CookieFlavor”
// For convenience I add an “emoji” property
// which maps a CookieFlavor to an emoji Character
enum CookieFlavor {
    
    case chocolateChip, fortune, stroopwafel
    
    var description : String {
        switch self {
        case .chocolateChip: return "Chocolate Chip"
        case .fortune: return "Fortune"
        case .stroopwafel: return "Stroopwafel"
        }
    }
    
    var emoji : Character {
        switch self {
        case .chocolateChip: return "🍪"
        case .fortune: return "🥠"
        case .stroopwafel: return "🧇"
        }
    }
}

// A Cookie has a flavor and an id (the id makes it “Hashable”)
// Why did I make Cookie Hashable?
// So that the underlying data strucutre I chose, a Set,
// can differentiate between individual cookies —— they all have unique IDs
struct Cookie : Hashable {
    let flavor : CookieFlavor
    var description : String { "\(flavor.description) Cookie" }
    private let id: UUID = UUID()
}

// A protocol defines just the func signatures / variables of a type, but NOT the implementation
// You can set the type of a vairable as a protocol, and then define the variable as an implmentation
// For example: let someProtocolInstance: CookieBageProtocol = CookieJar()
protocol CookieBagProtocol {
    var count : Int { get }
    var isEmpty : Bool { get }
    func insert(cookie: Cookie)
    func remove() -> Cookie?
    func emojis() -> String
}


// .count is STATE

// This class CookieJar "conforms" to the CookieBagProtocol
class CookieJar : CookieBagProtocol {
        
    public init() {}
    
    private var cookies = Set<Cookie>() // Set (a data type) containing instances of Cookie
    
    var count: Int { // computed property
        return cookies.count
    }
    
    var isEmpty : Bool {return cookies.count == 0}
    
    public func insert(cookie: Cookie) {
        cookies.insert(cookie)
        // I expect the STATE to change
    }
    
    public func remove() -> Cookie? { // Returns a Cookie or nil if the jar is empty
        if cookies.isEmpty { return nil }
        return cookies.removeFirst()
    }
    
    public func emojis() -> String {
        var chars = Array<Character>()
        for cookie in cookies { chars.append(cookie.flavor.emoji) }
        return String(chars)
    }
}

