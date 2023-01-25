//
//  CardView.swift
//  TinderClone
//
//  Created by Riley Lee on 24/1/2023.
//

import SwiftUI

struct CardView: View {
    
    @State var person: Person
    @Binding var fullscreenMode: Bool
    @EnvironmentObject var userMng: UserManager
    
    let screenCutoff = ( UIScreen.main.bounds.width / 2) * 0.8
    
    @Namespace var imageNameSpace
    
    var body: some View {
        GeometryReader { geo in
            if fullscreenMode {
                FullScreenCardView(person: person, fullscreenMode: $fullscreenMode, nameSpace: imageNameSpace)
                    .animation(.easeOut(duration: 0.2))
            } else {
                CardImageScroller(person: person, fullscreenMode: $fullscreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .padding(.leading, 10)
                    .matchedGeometryEffect(id: "image\(person.id)", in: imageNameSpace)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.default) {
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    withAnimation {
                                        person.degree = Double((value.translation.width/25) * -1)
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                    let width = value.translation.width
                                    
                                    if width >= 0 && width <= screenCutoff {
                                        // snap back to middle
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width <= -1 && width >= -screenCutoff { //left side
                                        // snap back to middle
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width > screenCutoff {
                                        // swipe right
                                        person.x = 500
                                        person.degree = 12
                                        userMng.swipe(person, _direction: .right)
                                    } else if width < -screenCutoff {
                                        // swipe left
                                        person.x = -500
                                        person.degree = -12
                                        userMng.swipe(person, _direction: .left)
                                    }
                                    
                                }
                            })
                    )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullscreenMode: .constant(true)).environmentObject(UserManager())
        CardView(person: Person.example, fullscreenMode: .constant(false)).environmentObject(UserManager())
    }
}
