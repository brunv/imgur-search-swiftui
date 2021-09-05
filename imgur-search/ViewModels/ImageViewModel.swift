//
//  ImageViewModel.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var images: [Img] = []
    @Published var showGallery: Bool = false
    @Published var isLoading: Bool = false
    @Published var feedbackMsg: String = ""
    @Published var feedbackIcon: String = ""
    
    init() {
        buildInitialMsg()
    }
    
    func fetchImages(for search: String) {
        isLoading = true
        ImgurAPI().fetchImages(for: search) { response in
            self.isLoading = false
            if response.success {
                self.images = response.images.filter { img in
                    return img.is_album == false
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
