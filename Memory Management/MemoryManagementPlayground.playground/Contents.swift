//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print("Person \(name) is initialized")
    }
    
    deinit {
        print("Person \(name) is being deallocated")
    }
}

//let person1 = Person(name: "John")
var person2: Person

do {
    let person1 = Person(name: "John")
    person2 = person1
}

//    var apartment: Apartment!

class Apartment {
    var address: String
//    var tenant: Person
    
    init(address: String) {
        self.address = address
//        self.tenant = Person(name: "Dummy")
        print("Apartment \(address) is initialized")
    }
    
    deinit {
        print("Apartment \(address) is being deallocated")
    }
}

//do {
//    let person1 = Person(name: "John")
//    let apartment1 = Apartment(address: "Hight Tech Campus")
//    person1.apartment = apartment1
//    apartment1.tenant = person1
//}


// Reference cycle with closures
/*let fullName: () -> String

lazy var fullName: () -> String = {
    return "\(self.name) My last name"
}*/

