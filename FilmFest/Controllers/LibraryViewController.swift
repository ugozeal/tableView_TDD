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
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Kung Fu Flick"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Dark Comedy", releaseDate: "2011"))
        
        libraryTableView.reloadData()
    }


}

