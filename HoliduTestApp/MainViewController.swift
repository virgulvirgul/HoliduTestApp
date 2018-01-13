//
//  ViewController.swift
//  HoliduTestApp
//
//  Created by Dmitry Poznukhov on 13.01.18.
//  Copyright © 2018 Dmitry inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Injectable {

    @IBOutlet private(set) var tableView: UITableView!
    var dataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }

    typealias InjectionType = Controllers?
    var injected: InjectionType = nil {
        didSet {
            injected?.books.search(query: "a") { [weak self] result in
                guard case let .success(books) = result else {
                    //show error
                    return
                }
                self?.dataSource = BooksDataSource(books: books)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UITableViewDelegate {


}

