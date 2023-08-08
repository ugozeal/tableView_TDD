//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by David Okonkwo on 08/08/2023.
//  Copyright © 2023 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
final class MovieCellTests: XCTestCase {
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let libraryVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController)
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

}
