//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str.remove(at: str.index(before: str.endIndex))

let choppedString = String(str.characters.dropLast())