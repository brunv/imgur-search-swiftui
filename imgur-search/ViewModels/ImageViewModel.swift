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
    
    func fetchNewContent(of content: String) {
        isLoading = true
        previousSearch = content
        pageNumber = 0
        images = []
        fetch(search: content, page: pageNumber)
    }
    
    func fetchMoreContent(id: String) {
        if userIsSeeingTheLastItem(id: id) {
            pageNumber += 1
            loadingNextPage = true
            fetch(search: previousSearch, page: pageNumber)
        }
    }
    
    func clearSearch() {
        buildInitialMsg()
    }
    
    private func fetch(search: String, page: Int) {
        ImgurAPI().fetchImages(for: search, page: page) { response in
            self.removeLoadingStates()
            
            if response.success {
                let filteredImgs = self.filterResponse(response: response.images)
                self.updateLastItemID(id: filteredImgs.last?.id)
                self.updateImagesArray(imgs: filteredImgs)
                self.showSearchResult()
            } else {
                self.buildErrorMsg(error: .generic)
            }
        }
    }
    
    private func userIsSeeingTheLastItem(id: String) -> Bool {
        return id == lastItemID
    }
    
    private func removeLoadingStates() {
        self.isLoading = false
        self.loadingNextPage = false
    }
    
    private func filterResponse(response: [Img]) -> [Img] {
        return response.filter { img in
            return img.is_album == false
        }
    }
    
    private func updateLastItemID(id: String?) {
        lastItemID = id
    }
    
    private func updateImagesArray(imgs: [Img]) {
        if images.isEmpty {
            images = imgs
        } else {
            images.append(contentsOf: imgs)
        }
    }
    
    private func showSearchResult() {
        if images.isEmpty {
            buildErrorMsg(error: .searchFailed)
        } else {
            showGallery = true
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
