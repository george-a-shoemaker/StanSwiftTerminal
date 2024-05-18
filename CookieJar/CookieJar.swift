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

// A there are strictly 3 cookie flavors
// Top help enforce this, I’ve captured the flavors as an enum named “CookieFlavor”
// For convenience I add an “emoji” property
// which maps a CookieFlavor to an emoji Character
public enum CookieFlavor {
    
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
public struct Cookie : Hashable {
    public init(flavor: CookieFlavor) {
        self.flavor = flavor
    }
    
    let flavor : CookieFlavor
    var description : String { "\(flavor.description) Cookie" }
    private let id: UUID = UUID()
    
}

// A protocol defines just the func signatures / variables of a type, but NOT the implementation
// You can set the type of a vairable as a protocol, and then define the variable as an implmentation
// For example: let someProtocolInstance: CookieBageProtocol = CookieJar()
public protocol CookieBagProtocol {
    func quantity() -> Int
    func insert(cookie: Cookie)
    func remove() -> Cookie?
    func emojis() -> String
}
// This class CookieJar "conforms" to the CookieBagProtocol
public class CookieJar : CookieBagProtocol {
    
    public init() {}
    
    private var cookies = Set<Cookie>()
    
    public func quantity() -> Int {
        return cookies.count
    }
    
    public func insert(cookie: Cookie) {
        cookies.insert(cookie)
    }
    
    public func remove() -> Cookie? {
        return cookies.removeFirst()
    }
    
    public func emojis() -> String {
        var chars = Array<Character>()
        for cookie in cookies { chars.append(cookie.flavor.emoji) }
        return String(chars)
    }
}

