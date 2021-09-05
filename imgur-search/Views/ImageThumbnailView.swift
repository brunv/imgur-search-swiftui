//
//  ImageThumbnailView.swift
//  imgur-search
//
//  Created by Bruno Vieira on 05/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageThumbnailView: View {
    
    let url: URL
    
    var body: some View {
        NavigationLink(destination: OpenImageView(url: url)) {
            WebImage(url: url)
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(8)
        }
    }
}


struct ImageThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageThumbnailView(url: URL(string: "")!)
    }
}
