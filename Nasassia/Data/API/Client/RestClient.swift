//
//  RestClient.swift
//  Nasassia
//
//  Created by ONUR BOSTAN on 29.01.2024.
//

import Foundation
import Alamofire

class RestClient {
    
    static var shared: RestClient {
        return RestClient()
    }
    
    fileprivate init() { }
    
    func getData(_ urlStr: String, params: [String: Any]? = nil, completion: @escaping (ApiResponse?) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            let combinedUrl = "\(Routes.baseUrl)\(urlStr)"
            let urlStr = combinedUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            AF.request(urlStr!,
                       method: .get,
                       parameters: params,
                       encoding: URLEncoding.queryString).responseJSON { response in
                        if response.data != nil && response.error == nil {
                            if response.response?.statusCode == 200 {
                                let res = ApiResponse(success: true, jsonData: response.data, data: nil, message: nil)
                                completion(res)
                            } else {
                                completion(nil)
                            }
                        } else {
                            completion(nil)
                }
            }
        }
    }
}
struct ApiResponse {
    var success: Bool
    var jsonData: Data?
    var data: [String: AnyObject]?
    var message: String?
}
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
