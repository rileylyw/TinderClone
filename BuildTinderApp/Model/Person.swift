//
//  Person.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation


struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
    var bio: String
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!],
        bio: "Sports lover, hit me up"
    )
    
    static let example2 = Person(
        name: "Amy",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "add me on snap ;)"
    )
}
