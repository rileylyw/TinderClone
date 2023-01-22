//
//  MessageListVM.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 6/1/2023.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // handle networking to load mesaagePreview from a server
        self.messagePreviews = MessagePreview.examples
    }
}
