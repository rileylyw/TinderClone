//
//  MessageThread.swift
//  TinderClone
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation


struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "hi, what you doing, when do you wanna come out, can i get your number plzzzzzz")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "hi, what you doing, when do you wanna come out, can i get your number plzzzzzz"),
        MessagePreview(person: Person.example2, lastMessage: "hello")
    ]
}
