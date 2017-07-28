//
//  ItemListViewController.swift
//  Todo
//
//  Created by Jose Alvarez on 7/27/17.
//  Copyright © 2017 CoStar. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
}
