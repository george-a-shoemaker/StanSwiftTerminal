//
//  main.swift
//  CookieJar
//
//  Created by George Shoemaker on 5/17/24.
//

import Foundation

// Notice that a CookieJar has a quantity func
// The quantity is "state" that changes
// as cookies are added and removed
let cookieJarA = CookieJar()
cookieJarA.insert(cookie: Cookie(flavor: .chocolateChip))
cookieJarA.insert(cookie: Cookie(flavor: .stroopwafel))
cookieJarA.insert(cookie: Cookie(flavor: .chocolateChip))
cookieJarA.insert(cookie: Cookie(flavor: .fortune))
print( "cookieJarA Contents: \(cookieJarA.emojis())" )
print("\nLet's move a cookie from cookieJarA to cookieJarB")
let cookieJarB = CookieJar()
while cookieJarA.quantity() > 0 {
    cookieJarB.insert(
        cookie: cookieJarA.remove()!
        // ! means force unwrap the result of .remove()
    )
}
print( "cookieJarA Contents: \(cookieJarA.emojis())" )
print( "cookieJarB Contents: \(cookieJarB.emojis())" )
print (cookieJarA.quantity())

//insertRemoveExample()


// ==========================================================
// Code George wrote to show the basic functions of CookieJar
func insertRemoveExample() {
    let cookieJarA : CookieBagProtocol = CookieJar()
    cookieJarA.insert(cookie: Cookie(flavor: .chocolateChip))
    cookieJarA.insert(cookie: Cookie(flavor: .chocolateChip))
    cookieJarA.insert(cookie: Cookie(flavor: .fortune))
    cookieJarA.insert(cookie: Cookie(flavor: .stroopwafel))
    
    print("cookieJarA has \(cookieJarA.quantity()) cookies!")
    print(cookieJarA.emojis())
    
    let cookieJarB : CookieBagProtocol = CookieJar()
    cookieJarB.insert(cookie: cookieJarA.remove()! )
    
    print("\ncookieJarB received a cookie from cookieJarA")
    print(cookieJarB.emojis())
    
    print("cookieJarA now has \(cookieJarA.quantity()) cookies!")
    print(cookieJarA.emojis())
}
