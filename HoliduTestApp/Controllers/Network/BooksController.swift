//
//  BooksController.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Foundation
import Gloss

struct BooksController: BooksControllerProtocol {

    let service = Services.Books(apiVersion: .v1)

    func search(query: String, completion: BookObjectsCompletion?) {
        service.search(query: query) { response in
            guard case let .success(rawData) = response else {
                completion?(.error)
                return
            }
            guard let json = rawData as? JSON else {
                completion?(.error)
                return
            }
            guard let jsonArray = json["items"] as? [JSON] else {
                completion?(.error)
                return
            }
            guard let books = [Models.Book].from(jsonArray: jsonArray) else {
                completion?(.error)
                return
            }

            completion?(.success(books))
        }
    }
}
