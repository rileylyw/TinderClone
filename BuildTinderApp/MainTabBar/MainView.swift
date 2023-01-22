//
//  MainView.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 03/12/2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState: AppStateManager // to access the states @EnvironmentObject
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
            
        case .fire:
            let view = Text("Fire")
            return AnyView(view)
        case .star:
            let view = Color.yellow
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                VStack {
                    HStack {
                        Spacer()
                        TabBarButtonView(type: .fire)
                        Spacer()
                        TabBarButtonView(type: .star)
                        Spacer()
                        TabBarButtonView(type: .message)
                        Spacer()
                        TabBarButtonView(type: .profile)
                        Spacer()
                    }
                    .frame(height: 65, alignment: .bottom)
                    .padding(30)
                    
                    correctViewForState()
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.vertical)
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
