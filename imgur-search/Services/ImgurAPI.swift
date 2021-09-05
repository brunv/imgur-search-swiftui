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
       
    func fetchImages(for query: String, page: Int, completionHandler: @escaping (ImgResponse) -> ()) {
        let url = buildUrl(for: query, page: page)
        let headers: HTTPHeaders = ["Authorization": "Client-ID \(key)"]
        
        AF.request(url, headers: headers).responseDecodable(of: ImgData.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    let imageResponse = ImgResponse(success: data.success, error: nil, images: data.data)
                    completionHandler(imageResponse)
                }

            case .failure(let data):
                print(">>> ERROR: \(data)")
                DispatchQueue.main.async {
                    let imageResponse = ImgResponse(success: false, error: ImgError.generic, images: [])
                    completionHandler(imageResponse)
                }
            }
        }
    }
    
    func buildUrl(for query: String, page: Int) -> String {
        return "\(baseUrl)/\(page)?q=\(query)&q_type=jpg"
    }
}
