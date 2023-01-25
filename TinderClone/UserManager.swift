//
//  UserManager.swift
//  TinderClone
//
//  Created by Riley Lee on 23/1/2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.cardPeople = Person.examples
    }
    
    private func loadUser() {
        // networking in real app
        self.currentUser = User.example
        // would have loadMatches() here to fire off matches
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
    
    public func swipe(_ person: Person, _direction: SwipeDirection) {
        cardPeople.removeLast()
        // networking to backend
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
        // networking to backend
    }
}

enum SwipeDirection {
    case right
    case left
}
