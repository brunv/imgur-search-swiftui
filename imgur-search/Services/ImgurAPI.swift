//
//  ImgurAPI.swift
//  imgur-search
//
//  Created by Bruno Vieira on 04/09/21.
//

import Foundation
import Alamofire

let key = "9e6db4ec707f8f3"
let baseUrl = "https://api.imgur.com/3/gallery/search/top"

class ImgurAPI {
    
    func fetchImages(for query: String, completionHandler: @escaping ([Img]) -> ()) {
        let url = buildUrl(for: query)
        let headers: HTTPHeaders = ["Authorization": "Client-ID \(key)"]
        
        AF.request(url, headers: headers).responseDecodable(of: ImgData.self) { response in

            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    let imageList = data.data
                    completionHandler(imageList)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    func buildUrl(for query: String) -> String {
        return "\(baseUrl)/0?q=\(query)&q_type=jpg"
    }
}
