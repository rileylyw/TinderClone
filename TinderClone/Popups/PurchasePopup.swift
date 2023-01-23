//
//  PurchasePopup.swift
//  TinderClone
//
//  Created by Riley Lee on 24/1/2023.
//

import SwiftUI

struct PurchasePopup: View {

    @Binding var isVisible: Bool // binding connects us to a single source of truth, pointing to a value somewhere else
    
    let screen = UIScreen.main.bounds
    
    func processPayment() {
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: 40)
                VStack {
                    // get tinder gold
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    // purchase swipe promo
                    Text("Purchase swipe promo")
                        .frame(height: geo.size.height/3)
                        .background(Color.gray)
                    
                    // 3 purchase options
                    Spacer()
                    
                    // continue
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            
                            Text("CONTINUE")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    })
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    // no thanks
                    Button(action: { isVisible = false }, label: {
                        Text("NO THANKS")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                    })
                    .padding(.vertical, 15)
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(.white)
            )
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring bills, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("Some legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff legal stuff.")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true)) // constant gives u a Binding
    }
}
