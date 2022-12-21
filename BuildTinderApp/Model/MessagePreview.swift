//
//  MessageThread.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation


struct MessagePreview {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hey")
}
