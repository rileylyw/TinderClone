//
//  AppStateManager.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 04/12/2022.
//

import Foundation

class AppStateManager: ObservableObject {
    
    @Published var selectedTab: TabBarButtonType = .fire
}
