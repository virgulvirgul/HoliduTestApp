//
//  Controllers.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Foundation

struct Controllers {
    let books: BooksControllerProtocol
}

protocol BooksControllerProtocol {

    typealias BookObjectsCompletion = (ObjectResponse<[Models.Book]>) -> ()

    func search(query: String, completion: BookObjectsCompletion?)
}
