//
//  ImageViewModel.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var images: [Img] = []
    
    init() {
        fetchImages(for: "cats")
    }
    
    func fetchImages(for search: String) {
        ImgurAPI().fetchImages(for: search) { response in
            self.images = response.filter { img in
                return img.is_album == false
            }
        }
    }
}
