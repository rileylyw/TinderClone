//
//  HomeView.swift
//  TinderClone
//
//  Created by Riley Lee on 25/1/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        VStack {
            CardStack(people: userMng.cardPeople)
            
            Spacer()
            
            HStack {
                // back
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                Spacer()
                
                // no
                CircleButtonView(type: .no) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, _direction: .left)
                    }
                }
                Spacer()
                
                // star
                CircleButtonView(type: .star) {
                    if let person = userMng.cardPeople.last {
                        if userMng.currentUser.goldSubscriber {
                            userMng.superLike(person)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                Spacer()
                
                // heart
                CircleButtonView(type: .heart) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, _direction: .right)
                    }
                }
                Spacer()
                
                // lightning
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
