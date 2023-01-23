//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Riley Lee on 04/12/2022.
//

import Foundation

class AppStateManager: ObservableObject {
    // tracking items
    @Published var selectedTab: TabBarButtonType = .fire
    @Published var showPersonsProfile: Person? = nil
    @Published var showPurchasePopup: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
