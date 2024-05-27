//
//  main.swift
//  StanSwiftTerminal
//
//  Created by George Shoemaker on 5/17/24.
//

import Foundation

sayHelloWorld()


let number: Int? = 42 //Optional.some(42)
let zeroNumber: Int? = Optional.some(0)

var schrodingersInteger : Int? = 43
schrodingersInteger = nil

print(schrodingersInteger!)






print(zeroNumber == nil) // Does noNumber equal nil? true or false
print(number == nil)

print(number!) // I fulfilled my promise to the compiler that there would be a value
print(zeroNumber!) // noNumber is nil. I made a promise to the compiler that there would be a value
