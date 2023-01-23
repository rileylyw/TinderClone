//
//  ChatManager.swift
//  TinderClone
//
//  Created by Riley Lee on 19/12/2022.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject { // track changes
    
    // published properties will affect changes in views, view s refresh based on these values
    @Published var messages: [Message] = [] // empty array in real app
    @Published var keyboardIsShowing: Bool = false
    
    // all active subsctiptions will be stored in cancellable
    var cancellable: AnyCancellable? = nil // protocol indicating an activity/action supports cancellation
    
    private var person: Person
    
    init (person: Person) { // whenever initialize ChatManager, fire off networking to load real msg
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message) {
        // Networking
        messages.append(message)
        // if networking failure, then show an error with some retry options
    }
    
    private let keyboardWillShow = NotificationCenter.default
        // publishers declare that a type can transmit a sequence of values over time
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true })
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({ _ in false })
    
    private func setupPublishers() { // subscribe to the above publishers
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide) // async
            .subscribe(on: DispatchQueue.main) // view changes should always happen in main thread
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReveived]
    }
    
    deinit {
        cancellable?.cancel()
    }
}
