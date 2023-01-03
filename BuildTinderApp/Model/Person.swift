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
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!])
}
