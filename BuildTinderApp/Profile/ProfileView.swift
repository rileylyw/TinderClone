//
//  ProfileView.swift
//  BuildTinderApp
//
//  Created by Riley Lee on 06/12/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                RoundedImage(url: URL(string: "https://picsum.photos/400"))
                    .frame(height: 175)
                
                Button(action: {}, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(Color.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                })
                .padding(.vertical, 10)
                .offset(x: -10)
            }
            Spacer().frame(height: 18)
            
            Text("Nikita, 25")
                .foregroundColor(.textTitle)
                .font(.system(size: 26, weight: .medium))
            
            Spacer().frame(height: 6)
            
            Text("Software Engineer")
            
            Spacer().frame(height: 22)
            
            HStack(alignment: .top) {
                Spacer()
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SETTINGS")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size: 38))
                            .padding(22)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("ADD MEDIA")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "shield.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SAFETY")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
    }
}
