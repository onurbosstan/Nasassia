//
//  PhotoService.swift
//  Nasassia
//
//  Created by ONUR BOSTAN on 29.01.2024.
//

import Foundation

class PhotoService {
    static var shared: PhotoService {
            return PhotoService()
        }
        
        fileprivate init() { }
        
        func getPhotos(rover: Rover, sol: Int? = 1000, page: Int, camera: NasaCamera?, completion: @escaping ([PhotoModel]?) -> Void) {
            var params = [String: Any]()
            
            params["sol"] = sol
            params["camera"] = camera?.rawValue
            params["api_key"] = Routes.api_key
            params["page"] = page
            
            let urlString = "\(rover.rawValue)/photos"
            
            RestClient.shared.getData(urlString, params: params) { response in
                
                if let data = response?.jsonData {
                    do {
                        let jsonData = try JSONDecoder().decode(PhotoResponse.self, from: data)
                        completion(jsonData.photos)
                    } catch {
                        completion([])
                    }
                } else {
                    completion([])
                }
            }
        }
}
