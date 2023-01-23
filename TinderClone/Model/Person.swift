//
//  Person.swift
//  TinderClone
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation


struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!],
        bio: "Sports lover, hit me up",
        age: 60
    )
    
    static let example2 = Person(
        name: "Amy",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "add me on snap ;)",
        age: 20
    )
    
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(name: "Olivia", imageURLS: [URL(string: "https://picsum.photos/400/302")!], bio: "hit me up", age: 30),
        Person(name: "Billy", imageURLS: [URL(string: "https://picsum.photos/400/303")!], bio: "YOOOOOO", age: 50),
        Person(name: "Georgia", imageURLS: [URL(string: "https://picsum.photos/400/304")!], bio: "My bio", age: 22),
        Person(name: "Samuel", imageURLS: [URL(string: "https://picsum.photos/400/305")!], bio: "Boring..", age: 35),
        Person(name: "Leslie", imageURLS: [URL(string: "https://picsum.photos/400/306")!], bio: "I'll sing you a song", age: 21),
        Person(name: "Peter", imageURLS: [URL(string: "https://picsum.photos/400/307")!], bio: "hit me w your best pickup line", age: 40)
    ]
}
