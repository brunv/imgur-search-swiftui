//
//  LoadingIndicator.swift
//  imgur-search
//
//  Created by Bruno Vieira on 05/09/21.
//

import SwiftUI

struct LoadingIndicator: View {
    let content: String
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text("Searching for \(content)...")
                .font(.caption)
        }
        .frame(maxHeight: .infinity)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(content: "")
    }
}
