//
//  CardImageScroller.swift
//  TinderClone
//
//  Created by Riley Lee on 24/1/2023.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    var person: Person
    
    @State private var imageIndex = 0
    
    // use binding when need to pass var up and down
    @Binding var fullscreenMode: Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        // setting bounds
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder{
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                 
                    VStack {
                        HStack {
                            Image(systemName: "heart.square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.green)
                                .frame(width: 150)
                                .rotationEffect(Angle(degrees: 10))
                                .opacity(Double(person.x / screenCutoff) - 1)
                            
                            Spacer()
                            
                            Image(systemName: "clear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(width: 150)
                                .rotationEffect(Angle(degrees: -10))
                                .opacity(Double(person.x / screenCutoff) * -1 - 1)
                        }
                        .padding(20)
                        Spacer()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture(perform: { updateImageIndex(addition: false) })
                        Rectangle()
                            .onTapGesture(perform: { updateImageIndex(addition: true) })
                    }
                    .foregroundColor(.white.opacity(0.01))
                }
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count) { idx in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(imageIndex == idx ? .white: .gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, fullscreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullscreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                            Button(action: { fullscreenMode = true }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .light))
                            })
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, fullscreenMode: .constant(false))
    }
}
