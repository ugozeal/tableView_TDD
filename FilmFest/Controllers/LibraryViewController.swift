//
//  ViewController.swift
//  FilmFest
//
//  Created by Author on 1/15/18.
//  Copyright © 2018 Author. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
    }


}

