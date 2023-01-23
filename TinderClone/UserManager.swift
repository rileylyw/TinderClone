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
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    
    private func loadUser() {
        // networking in real app
        self.currentUser = User.example
        // would have loadMatches() here to fire off matches
    }
    
    private func loadMatches() {
        matches = Person.examples
    }
    
    private func loadTopPicks() {
        topPicks = Person.examples.shuffled()
    }
}
