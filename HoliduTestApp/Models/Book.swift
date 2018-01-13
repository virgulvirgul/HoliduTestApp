//
//  Book.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import Gloss

extension Models {
    struct Book: JSONDecodable {

        let title: String
        let smallThumbnailUrl: URL

        init?(json: JSON) {
            guard let volumeInfo: JSON = "volumeInfo" <~~ json else { return nil }
            guard let title: String = "title" <~~ volumeInfo else { return nil }
            guard let imageLinks: JSON = "imageLinks" <~~ volumeInfo else { return nil }
            guard let smallThumbnail: String = "smallThumbnail" <~~ imageLinks else { return nil }
            guard let smallThumbnailUrl = URL(string: smallThumbnail) else { return nil }

            self.title = title
            self.smallThumbnailUrl = smallThumbnailUrl
        }
    }
}
