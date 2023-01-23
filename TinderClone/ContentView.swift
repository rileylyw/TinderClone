//
//  ContentView.swift
//  TinderClone
//
//  Created by Riley Lee on 03/12/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mng: AppStateManager = AppStateManager() // state lives here
    @ObservedObject var userMng: UserManager = UserManager()
    
    var body: some View {
        MainView() // where main view lives
            .environmentObject(mng) // everything will have access to this object
            .environmentObject(userMng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
