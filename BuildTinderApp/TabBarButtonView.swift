//
//  TapBarButtonView.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 03/12/2022.
//

import SwiftUI

enum TabBarButtonType: String {
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

struct TabBarButtonView: View {
    var type: TabBarButtonType
    var action: () -> Void // trailing closure, make sure its the last thing we pass in
    
    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.gray.opacity(0.5))
        })
    }
}


struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .profile) {
            print("HI")
        }
    }
}
