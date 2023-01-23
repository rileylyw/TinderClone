//
//  MessageRowView.swift
//  TinderClone
//
//  Created by Riley Lee on 20/1/2023.
//

import SwiftUI
import Kingfisher

struct MessageRowView: View {
    var preview: MessagePreview
    
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            
            VStack(alignment: .leading, spacing: 8) {
                // name
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                // msg prev
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
