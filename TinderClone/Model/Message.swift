//
//  Message.swift
//  TinderClone
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation


struct Message: Hashable {
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello")
    static let exampleReveived = Message(content: "Hello", person: Person.example)
}
