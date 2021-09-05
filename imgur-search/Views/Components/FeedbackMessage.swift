//
//  FeedbackMessage.swift
//  imgur-search
//
//  Created by Bruno Vieira on 05/09/21.
//

import SwiftUI

struct FeedbackMessage: View {
    let message: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .font(.system(size: 40))
            Text(message)
                .foregroundColor(.gray)
                .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

struct FeedbackMessage_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackMessage(message: "", icon: "")
    }
}
