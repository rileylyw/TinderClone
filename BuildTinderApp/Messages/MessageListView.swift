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
        ScrollView {
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
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                    }
                }
                Spacer().frame(height: 14)
                
                ZStack {
                    VStack { //TODO time 6.21 if empty show all
                        ForEach(vm.messagePreviews.filter({ searchText.isEmpty ? true : displayPreview($0) }), id: \.self) { preview in
                            NavigationLink(destination: ChatView(person: preview.person)
                            ) {
                                MessageRowView(preview: preview)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .transition(.slide)
                            .animation(.easeIn(duration: 0.25))
                        }
                    }
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                    
                }
                    
                Spacer()
            }
        }
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        // name
        if preview.person.name.contains(searchText) { return true }
        // last msg
        if preview.lastMessage.contains(searchText) { return true }
        // bio
        if preview.person.bio.contains(searchText) { return true }
        
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
