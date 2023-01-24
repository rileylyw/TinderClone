//
//  Person.swift
//  TinderClone
//
//  Created by Riley Lee on 19/12/2022.
//

import SwiftUI


struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
    var distance: Int
    var bioLong: String
    
    // for card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [
            URL(string: "https://picsum.photos/400/300")!,
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/302")!,
            URL(string: "https://picsum.photos/400/303")!,
            URL(string: "https://picsum.photos/400/304")!,
        ],
        bio: "Sports lover, hit me up",
        age: 60, distance: 20, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."
    )
    
    static let example2 = Person(
        name: "Amy",
        imageURLS: [
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/303")!,
            URL(string: "https://picsum.photos/400/305")!,
            URL(string: "https://picsum.photos/400/307")!,
            URL(string: "https://picsum.photos/400/309")!,
            URL(string: "https://picsum.photos/400/310")!
        ],
        bio: "add me on snap ;)",
        age: 20, distance: 25, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."
    )
    
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(name: "Olivia", imageURLS: [URL(string: "https://picsum.photos/400/302")!], bio: "hit me up", age: 30, distance: 30, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."),
        Person(name: "Billy", imageURLS: [URL(string: "https://picsum.photos/400/303")!], bio: "YOOOOOO", age: 50, distance: 60, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."),
        Person(name: "Georgia", imageURLS: [URL(string: "https://picsum.photos/400/304")!], bio: "My bio", age: 22, distance: 34, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."),
        Person(name: "Samuel", imageURLS: [URL(string: "https://picsum.photos/400/305")!], bio: "Boring..", age: 35, distance: 1, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."),
        Person(name: "Leslie", imageURLS: [URL(string: "https://picsum.photos/400/306")!], bio: "I'll sing you a song", age: 21, distance: 6, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool."),
        Person(name: "Peter", imageURLS: [URL(string: "https://picsum.photos/400/307")!], bio: "hit me w your best pickup line", age: 40, distance: 54, bioLong: "I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool. I'm really really cool.")
    ]
}
