//
//  ImageViewModel.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import Foundation

class ImageViewModel: ObservableObject {
    var pageNumber: Int = 0
    var previousSearch: String = ""
    var lastItemID: String? = ""
    
    @Published var images: [Img] = []
    @Published var showGallery: Bool = false
    @Published var isLoading: Bool = false
    @Published var loadingNextPage: Bool = false
    @Published var feedbackMsg: String = ""
    @Published var feedbackIcon: String = ""
    
    init() {
        buildInitialMsg()
    }
    
    func fetchImages(for search: String) {        
        if search != previousSearch {
            isLoading = true
            pageNumber = 0
            images = []
            fetch(search: search, page: pageNumber)
        } else {
            loadingNextPage = true
            pageNumber += 1
            fetch(search: search, page: pageNumber)
        }
        previousSearch = search
    }
    
    func loadMoreContent(id: String) {
        if id == lastItemID {
            fetchImages(for: previousSearch)
        }
    }
    
    private func fetch(search: String, page: Int) {
        ImgurAPI().fetchImages(for: search, page: page) { response in
            self.isLoading = false
            self.loadingNextPage = false
            
            if response.success {
                let filteredImgs = response.images.filter { img in
                    return img.is_album == false
                }
                self.lastItemID = filteredImgs.last?.id
                
                if self.images.isEmpty {
                    self.images = filteredImgs
                } else {
                    self.images.append(contentsOf: filteredImgs)
                }
                
                if self.images.isEmpty {
                    self.buildErrorMsg(error: .searchFailed)
                } else {
                    self.showGallery = true
                }
            } else {
                self.buildErrorMsg(error: .generic)
            }
        }
    }
    
    private func buildInitialMsg() {
        showGallery = false
        feedbackMsg = "Search for something awesome!"
        feedbackIcon = "binoculars"
    }
    
    private func buildErrorMsg(error: ImgError) {
        showGallery = false
        
        switch error {
        case .generic:
            feedbackMsg = "Something went wrong. Try again."
            feedbackIcon = "xmark.icloud"
        case .searchFailed:
            feedbackMsg = "Couldn't find what you're looking for."
            feedbackIcon = "eyes"
        }
    }
}
