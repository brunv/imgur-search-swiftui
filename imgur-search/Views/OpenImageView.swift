//
//  OpenImageView.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OpenImageView: View {
    var url: URL
    
    var body: some View {
        WebImage(url: url)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct OpenImageView_Previews: PreviewProvider {
    static var previews: some View {
        OpenImageView(url: URL(string: "")!)
    }
}
