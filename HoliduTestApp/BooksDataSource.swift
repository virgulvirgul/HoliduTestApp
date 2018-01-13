//
//  BooksDataSource.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import UIKit

fileprivate let cellId = "BookCell"

class BooksDataSource: NSObject, UITableViewDataSource {

    let books: [Models.Book]

    init(books: [Models.Book]) {
        self.books = books
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? BookCell else { fatalError() }

        let book = books[indexPath.row]
        cell.titleLabel.text = book.title
        cell.coverImageView.setUrl(book.smallThumbnailUrl)

        return cell
    }

}
