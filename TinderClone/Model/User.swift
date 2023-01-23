//
//  User.swift
//  TinderClone
//
//  Created by Riley Lee on 23/1/2023.
//

import Foundation

struct User { // myself
    var name: String
    var age: Int
    var jobTitle: String
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
    var imageURLS: [URL] = []

}

extension User {
    static let example = User(
        name: "Alex",
        age: 50,
        jobTitle: "Software Engineer",
        goldSubscriber: false,
        profileTip: "Photo Tip: Make waves with a beach photo and get more likes",
        imageURLS: [URL(string: "https://picsum.photos/400/308")!]
    )
}
