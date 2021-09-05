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
    @State var searchBarIsExpanded = false
    @State var search = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search...", text: $search)
                Button(action: {
                    imageViewModel.fetchImages(for: self.search)
                }, label: {
                    Text("     GO")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                })
            }.padding()
            ImageGridView(images: imageViewModel.images)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
