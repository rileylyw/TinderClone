//
//  MainView.swift
//  TinderClone
//
//  Created by Riley Lee on 03/12/2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState: AppStateManager // to access the states @EnvironmentObject
    @EnvironmentObject var userMng: UserManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
            
        case .fire:
            let view = HomeView()
            return AnyView(view)
        case .star:
            let view = MatchesView()
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
                
                if appState.showPurchasePopup {
                    // appState passing down Bool to PurchasePopupView
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 800))
                }
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
