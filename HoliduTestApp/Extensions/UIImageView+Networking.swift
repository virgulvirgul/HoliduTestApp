//
//  UIImageView+Networking.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import UIKit

fileprivate var session: URLSession?
fileprivate let cacheSize = 50_000_000

extension UIImageView {
    
    func setUrl(_ url: URL) {
        if session == nil {
            let configuration = URLSessionConfiguration.default
            configuration.requestCachePolicy = .returnCacheDataElseLoad
            configuration.urlCache = URLCache(memoryCapacity: cacheSize, diskCapacity: cacheSize, diskPath: nil)
            session = URLSession(configuration: configuration)
        }
        image = nil
        let request = URLRequest(url: url)
        let task = session?.dataTask(with: request) { (data, response, error) -> Void in
            guard let data = data else { return }
            let image = UIImage(data: data)
            OperationQueue.main.addOperation {
                self.image = image
            }
        }
        task?.resume()
    }
}
