//
//  MessageListView.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 6/1/2023.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListVM = MessageListVM()
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            // Search bar
            HStack {
                TextField("Search Matches", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color.textFieldBG)
                    .cornerRadius(8)
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.textPrimary)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading, 4)
                            Spacer()
                        }
                    )
                .padding(.horizontal, 10)
                .onTapGesture(perform: {
                    self.isEditing = true
                })
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        self.endEditing(true)
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.trailing, 10)
                }
            }
                
            Spacer()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
