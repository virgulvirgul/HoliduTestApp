//
//  BooksService.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Foundation
import Alamofire

fileprivate let baseUrl = "https://www.googleapis.com/books/"


extension Services {
    struct Books {

        typealias BooksCompletion = (Response) -> ()

        let apiVersion: APIVersion

        func search(query: String, completion: @escaping BooksCompletion) {
//            let parameters: Parameters = ["foo": "bar"]
//            Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON { response in
//                print("Request: \(String(describing: response.request))")   // original url request
//                print("Response: \(String(describing: response.response))") // http url response
//                print("Result: \(response.result)")                         // response serialization result
//
//                if let json = response.result.value {
//                    print("JSON: \(json)") // serialized json response
//                }
//
//                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                    print("Data: \(utf8Text)") // original server data as UTF8 string
//                }
//            }
            let parameters: Parameters = ["q": query]
            let urlString = baseUrl + apiVersion.rawValue + "/" + Command.volumes.rawValue
            Alamofire.request(urlString, parameters: parameters).responseJSON { response in
                guard let json = response.result.value else { return completion(.error) }
                completion(.success(json))
            }
        }
    }
}

fileprivate extension Services.Books {

    enum Command: String {
        case volumes = "volumes"
    }
}
