//
//  HomeView.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @ObservedObject var imageViewModel: ImageViewModel = ImageViewModel()
    @State var search = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search...", text: $search)
                
                if !search.isEmpty {
                    Button(action: {
                        search = ""
                        imageViewModel.clearSearch()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        imageViewModel.fetchNewContent(of: self.search)
                    }, label: {
                        Text("GO")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .padding(.leading)
                    })
                }
                
            }.padding()
            
            if imageViewModel.isLoading {
                LoadingIndicator(content: search)
            } else if imageViewModel.showGallery {
                ImageGridView(images: imageViewModel.images, loadingNextPage: imageViewModel.loadingNextPage, loadMoreCallback: {id in imageViewModel.fetchMoreContent(id: id)} )
            } else {
                FeedbackMessage(message: imageViewModel.feedbackMsg, icon: imageViewModel.feedbackIcon)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
