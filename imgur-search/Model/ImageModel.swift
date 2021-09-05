//
//  Image.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import Foundation

struct Img: Identifiable, Decodable {
    var id: String
    var link: String
    var is_album: Bool
    
    var url: URL {
        return URL(string: link)!
    }
}

struct ImgData: Decodable {
    var data: [Img]
}
