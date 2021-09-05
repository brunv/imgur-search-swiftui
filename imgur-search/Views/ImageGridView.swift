//
//  ImageGridView.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import SwiftUI

struct ImageGridView: View {
    let images: [Img]
    let loadingNextPage: Bool
    let loadMoreCallback: (String) -> Void
    
    var columns = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0),
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(images, id: \.id) { img in
                    ImageThumbnailView(id: img.id, url: img.url, loadMoreCallback: loadMoreCallback)
                }
                
            }.padding()
            
            if loadingNextPage {
                LoadingIndicator(content: "more")
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(images: [], loadingNextPage: false, loadMoreCallback: {_ in })
    }
}
