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
//            VStack(spacing: 0) {
//                HStack {
//                    if !searchBarIsExpanded {
//                        VStack(alignment: .leading, spacing: 8) {
//                            Text("Imgur Search")
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        }.foregroundColor(.black)
//                    }
//                    Spacer(minLength: 0)
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                        .onTapGesture {
//                            withAnimation {
//                                searchBarIsExpanded = true
//                            }
//                        }
//                    if searchBarIsExpanded {
//                        TextField("Search...", text: $search)
//
//                        Button(action: {
//                            withAnimation {
//                                searchBarIsExpanded = false
//                            }
//                        }, label: {
//                            Image(systemName: "xmark")
//                                .font(.system(size: 15, weight: .bold))
//                                .foregroundColor(.black)
//                        })
//                        .padding(.leading, 10)
//
//                        if !search.isEmpty {
//                            Button(action: {
//                                imageViewModel.fetchImages(for: self.search)
//                            }, label: {
//                                Text("     GO")
//                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .foregroundColor(.black)
//                            })
//                        }
//
//                    }
//                }
//                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//                .padding()
//                .background(Color.white)
//
//                Spacer()
//
//                ImageGridView(images: imageViewModel.images)
//            }
//            .background(Color.black.opacity(0.08).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
//            .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
